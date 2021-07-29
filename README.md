![Logo](https://images.kiwi.com/common/kiwicom-logo.svg)

# Top5

A simple iOS app that shows 5 interesting flights to destinations you can visit
- Day offers are limited to 5 per day and are not be repeated, that means that on the next day the app will display different set of flights/destinations
## Run Locally

Clone the project

```bash
  git clone https://github.com/Arsalan134/Top5
```

Go to the project directory

- Open Top5.xcodeproj file
- Press Run button or go to Product -> Run (⌘cmd + R)
- Enjoy
## Running Tests

To run tests, open Xcode and press (⌘cmd + U)
## API Reference

#### Get popular recommendations

```http
  GET https://api.skypicker.com/flights
```

| Parameter | Value     |
| :-------- | :------- |
| `v`       | `3` | 
| `sort`    | `popularity` | 
| `asc`     | `0` | 
| `locale`  | `en` | 
| `adults`  | `0` | 
| `children`| `0` | 
| `infants` | `0` | 
| `flyFrom` | `49.2-16.61-250km` | 
| `to`      | `anywhere` | 
| `featureName`     | `aggregateResults` | 
| `dateFrom`        | `06/09/2021` | 
| `dateTo`          | `06/09/2021` | 
| `typeFlight`      | `oneway` | 
| `one_per_date`    | `0` | 
| `oneforcity`      | `1` | 
| `wait_for_refresh`| `0` | 
| `affilid` | `your_solution_name` | 
| `limit`   | `5` | 
| `partner` | `skypicker` |  


#### Get destination citi image

```http
  https://images.kiwi.com/photos/600x330/citiName.jpg
```

| Parameter | Description     |
| :-------- | :------- |
| `citiName`| Destination citi name mapIdTo keyword  | 



## Documentation

Documentation of the API and its returned data is here:
https://docs.kiwi.com/#header-kiwi.com-api


## Authors

- [@Arsalan](https://www.github.com/arsalan134)
