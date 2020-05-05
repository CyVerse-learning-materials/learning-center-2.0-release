# Learning Center 2.0 Release Notes


## Upgrades to the templates and repositories

- CyVerse Learning logo replaces previous logo
- Fix/Improve documentation recommendations remove references to Wiki and
  Ask forum
- Style guide is to use the `Powered by CyVerse` buttons to link to
  DE apps or Atmosphere images
- Contributors.md removed from repo and replaced by a maintainer's heading  
  on index.rst
- New admonitions are available
  - Learning objectives
  - Sample data
  - Question and answer (click-to-reveal hidden answer)
- Add template for 2.0 release GitHub Issue
- Standardize `cyverse_rst_defined_substitutions.txt`
- Add `custom_urls.txt` as the place to collect repo-specific URLs
- Update CSS/Javascript for the repo
- Update the copyright year and version to prepare for a 2.0 release
  - We should now be using releases on GitHub. Everything that follows
    the new upgraded spec should be release 2.0
  - Workshop documentation should not cite the year (e.g. FOSS 2020) but should
    follow versioned releases and be kept in the same repo. A workshop site
    that presents an agenda and links to documentation could cite years/locations
    as workshop sites are unlikely to be updated past the workshop.


## GitHub Practices that should be implemented

- Every repo should have one of the following topic labels  
  - guide
  - quickstart
  - tutorial
  - manual
  - learning center
- Every repo should be approved to make it to the 2.0 release
- Every repo should contain the following template issues
  - Triage
  - Technical Issue
  - Learning Issue

## Other features

- A docker container that supports building CyVerse documentation is now
  available

  docker pull jasonjwilliamsny/cyverse-learning-materials-tools
