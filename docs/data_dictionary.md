# Data Dictionary - Bank Customer Churn (10,000 rows, 14 columns)

| Column | Type | Description |
|---|---|---|
| RowNumber | int | Row index (dropped in clean table) |
| CustomerId | int | Unique customer ID (primary key) |
| Surname | text | Customer surname |
| CreditScore | int | Credit score (350-850) |
| Geography | text | France / Germany / Spain |
| Gender | text | Male / Female |
| Age | int | Age in years (18-92) |
| Tenure | int | Years with the bank (0-10) |
| Balance | float | Account balance |
| NumOfProducts | int | Bank products held (1-4) |
| HasCrCard | 0/1 | Has credit card |
| IsActiveMember | 0/1 | Active member |
| EstimatedSalary | float | Estimated annual salary |
| Exited | 0/1 | Target: customer left the bank |
