# RICT developer's central

### How to improve this page
Because a (coding) inception guide must be simple and easy to understand, if you happen to encounter something that is still confusing or awkwardly described then don't hesitate to submit possible enhancements/clarifications (through [an issue](https://github.com/MEPP-team/RICT/issues) or a [PR (Pull Request)](https://help.github.com/en/articles/about-pull-requests#about-pull-requests)).

## Step by step inception guide

1. **Get aquainted with RICT's project big picture**
   * Read about the [whys and wherefores of the RICT project](../README.md): the general methodological framework RICT provides, as well as the [chosen software components](Devel/Architecture/Components.md#top) will both support and constrain your work.
   * As a general notice, and although RICT tries to follow mainstream practices (to reduce your surprises and associated loss of time), keep in mind that some practices used within RICT are specific to the project. As such they cannot be guessed or infered. This type of specific information is most often documented in the various [Readme.md](https://github.com/MEPP-team/UDV/README.md) and/or [Install.md](https://github.com/MEPP-team/UDV/blob/master/install.md) markdown files scattered across the repositories you will traverse.
   
1. **Pre-requisites**<br>
   Languages:
     - [JavaScript](https://en.wikipedia.org/wiki/JavaScript) for the [UDV](Devel/Architecture/Components.md#ComponentUDV) frontend: JavaScript proposed [tutorial](https://developer.mozilla.org/fr/docs/Web/JavaScript)
     - [Python3](https://en.wikipedia.org/wiki/Python_(programming_language)) for the [UDS](evel/Architecture/Components.md#ComponentUDS) back end
     - [C++](https://en.wikipedia.org/wiki/C%2B%2B) for some backend treatments (e.g. [SplitBuilding](Devel/Architecture/Components.md#ComponentUDSSplitBuilding)) requiring geography/geometry manipulations
   <br>
   Tooling:
     - [git](ToolGit.md)
     - [git development cylce](https://github.com/MEPP-team/RICT/blob/master/Doc/DevelopersGithubCycle.md)
   
1. **Access rights**<br>
   Optionnaly provide your github login to the project admin in order to get Github write access to the various repositories
   
1. **Documentation** 
   * Browse the [Doc/Devel subdirectory](https://github.com/MEPP-team/RICT/tree/master/Doc/Devel)
   
1. **Accessing the project sources**<br>
   Read on the proposed [Github's good practices](DevelopersGithubCycle.md).

1. **Installation**:
   * Clone [UDV](https://github.com/MEPP-team/UDV/tree/master/), install it and  [run the demos](https://github.com/MEPP-team/UDV/tree/master/UDV-Core/examples)

1. **Contributing code**
   * Respect (when available) the coding styles
   * [Submit a pull request (PR)](DevelopersGithubCycle.md#submitting-a-pull-request-pr): don't forget to provide a template. Keep in mind that it is much better to often submit small yet effective and mature PR than jumbo/bulk PR once in a while...
   * Place and maintain some gentle pressure when [asking for your pull request (PR) acceptation](DevelopersGithubCycle.md#pull-request-pr-acceptance-policy)

