# CreditScore
An iOS app that displays an user's credit score, written in Swift 5

![CreditReportViewController](https://i.imgur.com/0vE0xlO.png)
![CreditReportViewController](https://i.imgur.com/QvTwaYS.png)

## Installation

After cloning the project, run the following command inside the root folder:

```sh
pod install
```

## Libraries

- **ReachabilitySwift**: Network state observer
- **SnapKit**: Auto Layout DSL to facilitate View Code implementation
- **SwiftLint**: Code analysis tool that keeps code cleaner by enforcing conventions

## Features

- **Credit Score:**

  - A donut view that displays the user's credit score from the backend
  - The score can range from 0 to 700
  - Different score thresholds display the values (score and score band) in different colors
