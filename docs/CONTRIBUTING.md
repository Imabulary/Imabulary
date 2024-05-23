## Workflow

1. Everything starts from [roadmap](https://www.notion.so/20173907e74e4bf5be9833e53162824e?pvs=21), where we have timelines with tasks.

   Timelines are used to define time borders of each milestone of the product.

   Tasks are presented from “helicopter view”, meaning that they represent product goals from the highest level.

2. Next we have a GitHub [repository](https://github.com/DonAlexandro/Imabulary), where we store all our milestones, epics, user stories and technical tasks.

   - After we defined a high level timeline in the [roadmap](https://www.notion.so/20173907e74e4bf5be9833e53162824e?pvs=21), we create it as a milestone in our [repository](https://github.com/DonAlexandro/Imabulary/milestones) to be able to split it into epics, user stories, tasks, bugs, etc.

     Milestone timeframe is usually 1-3 months.

   - After you created a milestone, you might want to create a new [project](https://github.com/DonAlexandro/Imabulary/projects?query=is%3Aopen) which represents the single sprint of the milestone. A few sprints (projects) can be attached to the single milestone.

     Sprint timeframe is 2 weeks.

   - After you created a sprint (project), you will split the sprint into user stories, bugs and tasks. Each item if possible, should belong to some epic, so you can sort tasks inside the sprint by creating separate boards for each epic.
   - Items inside the board must have description, estimation and priority. Estimation is done by using days and hours (e. g. `2d 4h`)

## Git standards

### Branches

The name structure of the branch is next: [feature|bug|doc|dev]/[number-of-the-issue]-[name-of-the-branch]

- `feature` prefix is for feature branch
- `bug` prefix is for the branch that will fix the bug
- `doc` prefix is for the branch that will update the documentation
- `dev` prefix is for some general task that is neither feature nor a bug

### Commits

For commit messages we're using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary) standard.

## Code style

### Mobile

To follow the best Dart & Flutter conventions and see linting warnings, please install: [Dart VSCode extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) and [Flutter VSCode extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

### Backend

1. We have ESLint configured, so please install the [VSCode extension](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) to see warnings if something is wrong with the code styling
2. To follow the code standards automatically, use [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
