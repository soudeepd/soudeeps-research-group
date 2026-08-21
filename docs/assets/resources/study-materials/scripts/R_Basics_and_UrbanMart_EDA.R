# =============================================================================
# R BASICS AND URBANMART EXPLORATORY DATA ANALYSIS
# =============================================================================
# Purpose:
#   1. Practise basic R syntax.
#   2. Install and load packages safely.
#   3. Read UrbanMart_dataset.xlsx.
#   4. Check, summarise, and visualise the data.
#
# Recommended setup:
#   Create an RStudio Project and place this script and the Excel file in the
#   project folder. Run one section at a time with Ctrl + Enter (Windows/Linux)
#   or Cmd + Enter (macOS).
#
# Important:
#   Keep the original Excel file unchanged. This script only reads it.
# =============================================================================


# 1. BASIC R CODING -----------------------------------------------------------

# R can be used as a calculator.
2 + 3
10 / 4
2^3

# Use <- to assign a value to an object.
course_sessions <- 5
hours_per_session <- 2
total_course_hours <- course_sessions * hours_per_session
total_course_hours

# A vector stores several values of the same general type.
sample_profit <- c(120, -30, 85, 0, NA)
sample_profit

# Useful functions can describe an object.
length(sample_profit)
class(sample_profit)
summary(sample_profit)

# NA means a missing value. Use na.rm = TRUE when appropriate.
mean(sample_profit, na.rm = TRUE)
sum(sample_profit, na.rm = TRUE)

# Logical conditions return TRUE or FALSE.
sample_profit > 0
sum(sample_profit > 0, na.rm = TRUE)

# A data frame is a rectangular table: observations in rows, variables in
# columns.
example_orders <- data.frame(
  order_id = c("A101", "A102", "A103"),
  sales = c(500, 750, 300),
  profit = c(80, -25, 45)
)

example_orders
example_orders$sales
example_orders[example_orders$profit > 0, ]


# 2. INSTALL AND LOAD PACKAGES ------------------------------------------------

# Install a package once; load it in every new R session.
# The following code installs only packages that are missing.
required_packages <- c(
  "readxl",   # read Excel workbooks
  "dplyr",    # transform and summarise data
  "ggplot2",  # create charts
  "janitor",  # clean column names
  "readr",    # safely parse numbers
  "scales"    # format chart axes
)

installed_names <- rownames(installed.packages())
missing_packages <- setdiff(required_packages, installed_names)

if (length(missing_packages) > 0) {
  install.packages(missing_packages, dependencies = TRUE)
}

invisible(
  lapply(required_packages, library, character.only = TRUE)
)


# 3. LOCATE AND READ THE EXCEL FILE ------------------------------------------

# Best practice: use an RStudio Project and relative paths. Do not use setwd()
# inside a shared script.

## set the working directory as the current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Put the Excel file in the project folder.and check if it is there
data_file <- "UrbanMart_dataset.xlsx"
file.exists(data_file)

# See the sheet names before importing.
readxl::excel_sheets(data_file)

# Read the first sheet. Change sheet = 1 to a sheet name if needed.
urbanmart_raw <- readxl::read_excel(
  path = data_file,
  sheet = 1,
  na = c("", "NA", "N/A")
)

# Convert names such as Order.ID or Order ID to order_id.
urbanmart <- janitor::clean_names(urbanmart_raw)


# 4. FIRST INSPECTION ---------------------------------------------------------

dim(urbanmart)             # number of rows and columns
names(urbanmart)           # column names after cleaning
head(urbanmart, 6)         # first six rows
dplyr::glimpse(urbanmart)  # names, data types, and sample values
summary(urbanmart)         # simple summaries for every column

# Open a spreadsheet-style viewer when working interactively in RStudio.
if (interactive()) {
  View(urbanmart)
}


# 5. CHECK THE EXPECTED COLUMNS ----------------------------------------------

required_columns <- c(
  "order_id", "order_date", "ship_date", "segment", "region",
  "category", "subcategory", "sales", "quantity", "discount", "profit"
)

missing_columns <- setdiff(required_columns, names(urbanmart))

if (length(missing_columns) > 0) {
  stop(
    "Expected columns are missing after name cleaning: ",
    paste(missing_columns, collapse = ", ")
  )
}


# 6. PREPARE DATA TYPES AND CREATE USEFUL VARIABLES --------------------------

# Helper: handle dates imported by readxl as Date, date-time, Excel serial
# number, or common character formats.
as_urbanmart_date <- function(x) {
  if (inherits(x, "Date")) {
    return(x)
  }

  if (inherits(x, "POSIXt")) {
    return(as.Date(x))
  }

  if (is.numeric(x)) {
    return(as.Date(x, origin = "1899-12-30"))
  }

  x <- as.character(x)
  result <- suppressWarnings(as.Date(x))

  still_missing <- is.na(result) & !is.na(x)
  if (any(still_missing)) {
    result[still_missing] <- suppressWarnings(
      as.Date(x[still_missing], format = "%m/%d/%Y")
    )
  }

  result
}

# Helper: retain numeric values or extract numbers from text such as "1,250".
as_urbanmart_number <- function(x) {
  if (is.numeric(x)) {
    return(x)
  }

  readr::parse_number(as.character(x), na = c("", "NA", "N/A"))
}

urbanmart <- urbanmart |>
  dplyr::mutate(
    order_date = as_urbanmart_date(order_date),
    ship_date = as_urbanmart_date(ship_date),
    dplyr::across(
      .cols = c(sales, quantity, discount, profit),
      .fns = as_urbanmart_number
    ),
    shipping_days = as.numeric(ship_date - order_date),
    profit_status = dplyr::if_else(
      profit > 0,
      "Profitable",
      "Non-profitable",
      missing = "Missing"
    ),
    profit_margin = dplyr::if_else(
      sales != 0,
      profit / sales,
      NA_real_
    )
  )

# UrbanMart discount is expected to be stored as a proportion, for example
# 0.20 for 20%. A maximum above 1 may indicate a percentage-format issue.
if (max(urbanmart$discount, na.rm = TRUE) > 1) {
  warning(
    "Discount has values above 1. Check whether percentages need conversion."
  )
}


# 7. DATA-QUALITY CHECKS ------------------------------------------------------

# Missing values in each column, largest count first.
missing_value_check <- sort(
  colSums(is.na(urbanmart)),
  decreasing = TRUE
)
missing_value_check

# Duplicate complete rows. Repeated order IDs can be valid because an order
# may contain several product lines.
duplicate_complete_rows <- sum(duplicated(urbanmart))
duplicate_complete_rows

# Check ranges of the core numeric variables.
urbanmart |>
  dplyr::summarise(
    min_sales = min(sales, na.rm = TRUE),
    max_sales = max(sales, na.rm = TRUE),
    min_profit = min(profit, na.rm = TRUE),
    max_profit = max(profit, na.rm = TRUE),
    min_discount = min(discount, na.rm = TRUE),
    max_discount = max(discount, na.rm = TRUE),
    min_shipping_days = min(shipping_days, na.rm = TRUE),
    max_shipping_days = max(shipping_days, na.rm = TRUE)
  )


# 8. OVERALL EXPLORATORY SUMMARY --------------------------------------------

overall_summary <- urbanmart |>
  dplyr::summarise(
    order_lines = dplyr::n(),
    distinct_orders = dplyr::n_distinct(order_id),
    total_sales = sum(sales, na.rm = TRUE),
    total_profit = sum(profit, na.rm = TRUE),
    overall_profit_margin = total_profit / total_sales,
    average_order_line_sales = mean(sales, na.rm = TRUE),
    average_discount = mean(discount, na.rm = TRUE),
    profitable_line_share = mean(profit > 0, na.rm = TRUE),
    average_shipping_days = mean(shipping_days, na.rm = TRUE)
  )

overall_summary %>% mutate_if(is.numeric,round,digits = 3) %>% View()


# 9. GROUPED SUMMARIES --------------------------------------------------------

category_summary <- urbanmart |>
  dplyr::group_by(category) |>
  dplyr::summarise(
    order_lines = dplyr::n(),
    total_sales = sum(sales, na.rm = TRUE),
    total_profit = sum(profit, na.rm = TRUE),
    profit_margin = total_profit / total_sales,
    average_discount = mean(discount, na.rm = TRUE),
    .groups = "drop"
  ) |>
  dplyr::arrange(dplyr::desc(total_profit))

category_summary %>% mutate_if(is.numeric,round,digits = 3) %>% View()

region_summary <- urbanmart |>
  dplyr::group_by(region) |>
  dplyr::summarise(
    order_lines = dplyr::n(),
    total_sales = sum(sales, na.rm = TRUE),
    total_profit = sum(profit, na.rm = TRUE),
    profit_margin = total_profit / total_sales,
    average_discount = mean(discount, na.rm = TRUE),
    .groups = "drop"
  ) |>
  dplyr::arrange(dplyr::desc(total_profit))

region_summary %>% mutate_if(is.numeric,round,digits = 3) %>% View()

subcategory_summary <- urbanmart |>
  dplyr::group_by(subcategory) |>
  dplyr::summarise(
    order_lines = dplyr::n(),
    total_sales = sum(sales, na.rm = TRUE),
    total_profit = sum(profit, na.rm = TRUE),
    profit_margin = total_profit / total_sales,
    .groups = "drop"
  ) |>
  dplyr::arrange(total_profit)

head(subcategory_summary, 10)


# 10. EXPLORE DISCOUNT BANDS --------------------------------------------------

urbanmart <- urbanmart |>
  dplyr::mutate(
    discount_band = cut(
      discount,
      breaks = c(-Inf, 0, 0.10, 0.20, 0.30, Inf),
      labels = c("0%", "0-10%", "10-20%", "20-30%", "Above 30%"),
      include.lowest = TRUE,
      right = TRUE
    )
  )

discount_summary <- urbanmart |>
  dplyr::group_by(discount_band) |>
  dplyr::summarise(
    order_lines = dplyr::n(),
    total_sales = sum(sales, na.rm = TRUE),
    total_profit = sum(profit, na.rm = TRUE),
    profit_margin = total_profit / total_sales,
    profitable_line_share = mean(profit > 0, na.rm = TRUE),
    .groups = "drop"
  )

discount_summary %>% mutate_if(is.numeric,round,digits = 3) %>% View()


# 11. SIMPLE VISUAL EXPLORATION ----------------------------------------------

theme_set(
  ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(
      plot.title.position = "plot",
      panel.grid.minor = ggplot2::element_blank()
    )
)

# Plot 1: Do larger order lines also produce more profit?
plot_sales_profit <- ggplot2::ggplot(
  urbanmart,
  ggplot2::aes(x = sales, y = profit)
) +
  ggplot2::geom_hline(yintercept = 0, colour = "#B33A3A") +
  ggplot2::geom_point(alpha = 0.35, colour = "#2E74B5") +
  ggplot2::geom_smooth(
    method = "lm",
    formula = y ~ x,
    se = FALSE,
    colour = "#00897B"
  ) +
  ggplot2::scale_x_continuous(labels = scales::label_number()) +
  ggplot2::scale_y_continuous(labels = scales::label_number()) +
  ggplot2::labs(
    title = "Sales and profit at the order-line level",
    x = "Sales",
    y = "Profit"
  )

plot_sales_profit

# Plot 2: Which categories contribute the most profit?
plot_category_profit <- ggplot2::ggplot(
  category_summary,
  ggplot2::aes(
    x = stats::reorder(category, total_profit),
    y = total_profit
  )
) +
  ggplot2::geom_col(fill = "#2E74B5", width = 0.68) +
  ggplot2::coord_flip() +
  ggplot2::scale_y_continuous(labels = scales::label_number()) +
  ggplot2::labs(
    title = "Total profit by category",
    x = NULL,
    y = "Total profit"
  )

plot_category_profit

# Plot 3: How does the profit margin change across discount bands?
plot_discount_margin <- ggplot2::ggplot(
  discount_summary,
  ggplot2::aes(x = discount_band, y = profit_margin)
) +
  ggplot2::geom_hline(yintercept = 0, colour = "#B33A3A") +
  ggplot2::geom_col(fill = "#D9A441", width = 0.68) +
  ggplot2::scale_y_continuous(labels = scales::label_percent()) +
  ggplot2::labs(
    title = "Profit margin by discount band",
    x = "Discount band",
    y = "Profit margin"
  )

plot_discount_margin


# 12. SAVE REUSABLE OUTPUTS ---------------------------------------------------

output_dir <- "urbanmart_eda_outputs"
dir.create(output_dir, showWarnings = FALSE)

utils::write.csv(
  overall_summary,
  file.path(output_dir, "overall_summary.csv"),
  row.names = FALSE
)

utils::write.csv(
  category_summary,
  file.path(output_dir, "category_summary.csv"),
  row.names = FALSE
)

utils::write.csv(
  region_summary,
  file.path(output_dir, "region_summary.csv"),
  row.names = FALSE
)

utils::write.csv(
  discount_summary,
  file.path(output_dir, "discount_summary.csv"),
  row.names = FALSE
)

ggplot2::ggsave(
  filename = file.path(output_dir, "sales_vs_profit.png"),
  plot = plot_sales_profit,
  width = 8,
  height = 5,
  dpi = 300
)

ggplot2::ggsave(
  filename = file.path(output_dir, "category_profit.png"),
  plot = plot_category_profit,
  width = 8,
  height = 5,
  dpi = 300
)

ggplot2::ggsave(
  filename = file.path(output_dir, "discount_margin.png"),
  plot = plot_discount_margin,
  width = 8,
  height = 5,
  dpi = 300
)


# 13. REFLECTION QUESTIONS ----------------------------------------------------

# 1. Which category and region contribute the most total profit?
# 2. Are high-sales order lines always profitable?
# 3. At which discount bands does profit performance weaken?
# 4. Which subcategories deserve a closer commercial review?
# 5. What additional checks are needed before drawing causal conclusions?

# End of script.
