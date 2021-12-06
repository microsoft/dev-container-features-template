> ⚠️ NOTE: This is a work-in-progress project. Subject to (heavy) modification!  

# Developer container `features` Template

To create your own remote [devcontainer features](#), use this repo as a template.  This repo contains two example "features" called `helloworld` and `color`.  

These features can then be declared in your `devcontainer.json` file for use in the Remote-Containers extension or GitHub Codespaces.


# Features In This Repo (Directory)

### helloworld

This is a sample feature that prints whatever option you pass to it when invoking the `hello` program in a terminal.

### color

Prints your favorite color (in that color) when you run the program `color` in your terminal. 

Note: Your favorite color can only be `green`, `red`, or `gold`.

## Release Flow

Push a tag (eg `v0.0.1`) to your repo, which will trigger the [deploy-features action](https://github.com/microsoft/publish-dev-container-features-action) in this repo's [`deploy-features.yml` workflow file](https://github.com/microsoft/dev-container-features-template/blob/main/.github/workflows/deploy-features.yml).

Assets will be compressed and added as a release artifact with the name `features.tgz`. 

The latest set can be directly downloaded with a URI like: `https://github.com/<USER>/<REPO>/releases/latest/download/features.tgz`

Or, downloaded from a previous tag (eg: `v0.0.1`) like: `https://github.com/<OWNER>/<REPO>/releases/download/v0.0.1/features.tgz`


## Include feature in your project's devcontainer 

To include your feature in a project's devcontainer, provide the following `feature` like so.

```jsonc
features: {
    "<OWNER>/<REPO>/helloworld": {
        "greeting": "Hello!"
    },
    "<OWNER>/<REPO>/color": {
        "color": "green" 
    }
}
```

- Where OWNER is the repo owner (for this template, `microsoft`).
- Where REPO is the repo name (for this template, `dev-container-features-template`)

Providing no version implies the latest release's artifacts.  To supply a tag as a version, use the following notation.

```jsonc
features: {
    "<OWNER>/<REPO>/helloworld@v0.0.1": {
        greeting: "Hello!"
    }
}
```

------ 

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the Microsoft Open Source Code of Conduct. For more information see the Code of Conduct FAQ or contact opencode@microsoft.com with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow Microsoft's Trademark & Brand Guidelines. Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship. Any use of third-party trademarks or logos are subject to those third-party's policies.
