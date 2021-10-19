# licence-scan-go

## Step-by-step Instructions

The plan is to create the GitHub action to this repository and then use it from another repository [hello-world-go](https://github.com/lauravuo/hello-world-go). We will improve the functionality incrementally, and test the changes along the way. Let's release a new version of the action each time a PR is merged so that changes can be tested from the test project.

1. **Fork this repository and create a new feature-branch**

1. **Create a skeleton for [Docker container action](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action) to your feature-branch.** You can use the placeholder texts from the instructions for now:

   1. [Create a Dockerfile](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#creating-a-dockerfile)
   1. [Create an action metadata file](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#creating-an-action-metadata-file)
   1. [Write the action code](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#writing-the-action-code)
   1. Commit and push the changes
   1. Create PR and ask the maintainer to release a new version of the action once the PR is merged.

   You should have added following files to the root of this repository:

   ```bash
   action.yml
   Dockerfile
   entrypoint.sh
   ```

1. **Fork the test repository [hello-world-go](https://github.com/lauravuo/hello-world-go) and create a new feature-branch**

1. **[Add a new job](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#example-using-a-public-action) to the hello-world-go project [test workflow](https://github.com/lauravuo/hello-world-go/blob/main/.github/workflows/test.yml) where you test the new GitHub Action you created in step 2.**
   1. Edit the file `test.yml`accordingly
   1. Commit and push changes. See the logs for your added job in Actions tab and check does the job succeed. (_Note: if the maintainer has not released yet the action, it cannot be run._)
   1. Create PR for the change.
1. **Add actual license checks using lichen.**
   1. Create new feature-branch for your _licence-scan-go_-fork.
   1. Copy content from [this gist](https://gist.github.com/lauravuo/76d675136e1066cf4cab01af04fd9776):
      - Replace contents of `Dockerfile`
      - Replace contents of `entrypoint.sh`
      - Add new file `lichen.sh`. Do not forget to make the file executable (`chmod a+x lichen.sh`)
      - Add new file `lichen-cfg.yaml`
   1. Create PR and ask the maintainer to release a new version of the action once the PR is merged.
1. **Update the action version in the test project**
   1. Create new feature-branch for your _hello-world-go_-fork.
   1. Edit the new job that was added in step 4 so that it uses the latest version of the scan action. Commit and push changes, and check that the job succeeds.
   1. Create PR.
1. **Continue with further enhancements to the licence-scan-go action**:
   - Update [the action metadata](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions) with correct information
   - [Update README](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#creating-a-readme) with usage instructions
   - Make license list configurable, so that the action user could define the allowed licenses.
   - Figure out what are the arguments that lichen.sh-script takes and add support to those to metadata and README.
   - How about adding some GitHub actions to this project? What kind of automated checks/tests would be beneficial for this GitHub Action project?
