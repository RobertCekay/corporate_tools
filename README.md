# Dino Management

![Ruby CI](https://github.com/robertcekay/corporate_tools/actions/workflows/ci.yml/badge.svg)

A Ruby refactoring exercise demonstrating clean code practices, object-oriented design, automated testing, and continuous integration.

## Overview

This project refactors an intentionally unoptimized dinosaur management script into a clean, maintainable Ruby service object.

The application processes dinosaur data and:

- Calculates dinosaur health based on age, category, and diet.
- Determines whether dinosaurs are alive or dead.
- Calculates age metrics.
- Generates category summaries.

## Features

✅ Clean Ruby service object design
✅ Separation of business logic and tests
✅ Comprehensive RSpec test coverage
✅ Input data protection (no mutation of original records)
✅ Edge case handling
✅ Automated CI validation with GitHub Actions

## Refactoring Improvements

The original implementation contained:

- Deeply nested conditional statements.
- Duplicate health calculation logic.
- Mixed responsibilities inside a single method.
- Hidden mutation of input data.
- Missing test coverage.

The refactored version improves this by:

- Creating a dedicated `DinoManagement` service class.
- Extracting business rules into focused methods.
- Using clear method names to communicate intent.
- Keeping the public API small.
- Adding automated tests for expected behavior and edge cases.

## Requirements

- Ruby 3.4+
- Bundler

## Installation

Clone the repository:

```bash
git clone https://github.com/robertcekay/corporate_tools.git

cd corporate_tools
```

Install dependencies:

```bash
bundle install
```

## Running the Application

The project includes a `main.rb` file that demonstrates running the dinosaur management service with sample data.

Run:

```bash
ruby main.rb
```

Example usage:

```ruby
require_relative "dino_management"

dinos = [
  {
    "name" => "DinoA",
    "category" => "herbivore",
    "period" => "Cretaceous",
    "diet" => "plants",
    "age" => 100
  },
  {
    "name" => "DinoB",
    "category" => "carnivore",
    "period" => "Jurassic",
    "diet" => "meat",
    "age" => 80
  }
]

puts DinoManagement.run(dinos)
```

## Running Tests

Run the full test suite:

```bash
bundle exec rspec
```

Expected output:

```
Finished in X seconds

X examples, 0 failures
```

## Continuous Integration

This project uses GitHub Actions to automatically validate every change.

Every push and pull request runs:

✅ Ruby environment setup
✅ Dependency installation
✅ RSpec test suite

A pull request will only pass if all specs succeed.

## Project Structure

```
.
├── .github
│   └── workflows
│       └── ci.yml
│
├── spec
│   ├── spec_helper.rb
│   └── dino_management_spec.rb
│
├── dino_management.rb
├── main.rb
├── Gemfile
├── Gemfile.lock
├── .rspec
└── README.md
```

## Architecture

The application uses a service object pattern.

`DinoManagement.run(dinos)` acts as the public entry point and coordinates:

1. Processing dinosaur records.
2. Applying business rules.
3. Generating summary statistics.

Internal calculations are separated into private methods to keep responsibilities isolated and the code easier to maintain.

## Design Decisions

### Single Responsibility

Each method handles one specific responsibility:

- `calculate_health` handles health rules.
- `alive?` determines dinosaur status.
- `age_metrics` calculates age statistics.
- `summarize` creates category counts.

### Small Public API

The only public entry point is:

```ruby
DinoManagement.run(dinos)
```

Implementation details remain private.

### Data Safety

Input dinosaur records are duplicated before modification to avoid unexpected side effects.

### Testing Strategy

The test suite covers:

- Health calculation.
- Alive/dead status.
- Age metrics.
- Category summaries.
- Incorrect diets.
- Empty collections.
- Invalid ages.
- Input mutation prevention.

## Future Improvements

Possible extensions:

- Add support for additional dinosaur categories.
- Replace hash-based data with domain objects.
- Add database persistence.
- Add API endpoints.
- Add performance benchmarks.

---