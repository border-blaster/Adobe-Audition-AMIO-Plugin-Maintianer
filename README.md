# Adobe Audition AMIO Plugin Maintainer

This repository helps maintain .amio plugin files in the `\plugin\amio\` folder, ensuring they are not lost after Adobe Audition version updates.

## Environment

- Windows Active Directory network
- Adobe Creative Cloud
- Adobe Audition

## Problem

There is a requirement for .amio plugin files to be placed in `C:\Program Files\Adobe\Adobe Audition *\PlugIns\Amio\` automatically after a manual install and to be migrated after a version change.

## Solution Elements

### Files

- PowerShell script
- .amio files

### Scheduled Task

- Runs a PowerShell script to place the files

### Group Policy

- Deploys files and schedules tasks
