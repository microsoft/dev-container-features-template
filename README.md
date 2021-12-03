> ⚠️ NOTE: This is a work-in-progress/my experimental project. Subject to (heavy) modification!

# Devcontainer Features Template

To create your own remote [devcontainer features](#), use this repo as a template.  This repo contains two "features" called `helloworld` and `color`.


# Features In This Repo (Directory)

### helloworld

This is a sample feature that prints whatever option you pass to it when invoking the `hello` program in a terminal.

### color

Prints your favorite color (in that color) when you run the program `color` in your terminal. 

Note: Your favorite color can only be `green`, `red`, or `gold`.

## Release Flow

Push a tag to your repo, which will trigger the [deploy-features workflow](https://github.com/joshspicer/devcontainer-features-template/blob/main/.github/workflows/deploy-features.yml).

Assets will be compressed and added as a release artifact with the name `features.tgz`. 

The latest set can be directly downloaded with a URI like:

`https://github.com/<USER>/<REPO>/releases/latest/download/features.tgz`

Download from a previous tag (eg: `v0.0.1`) like so:

`https://github.com/<USER>/<REPO>/releases/download/v0.0.1/features.tgz`

Note that `latest` and `v0.0.1` are not in the same spot.


## Include feature in your project's devcontainer 

To include your feature in a project's devcontainer, provide the following `feature` like so.

```jsonc
features: {
    "<PUBLISHER>/<REPO>#helloworld": {
        "greeting": "Hello!"
    },
    "<PUBLISHER>/<REPO>#color": {
        "color": "green" 
    }
}
```

- Where PUBLISHER is the repo owner (for this template, `joshspicer`).
- Where REPO is the repo name (for this template, `devcontainer-features-template`)

Providing no version implies the latest release's artifacts.  To supply a tag as a version, use the following notation.

```jsonc
features: {
    "<PUBLISHER>/<REPO>#helloworld@v0.0.1": {
        greeting: "Hello!"
    }
}
```
