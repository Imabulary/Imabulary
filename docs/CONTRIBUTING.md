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
