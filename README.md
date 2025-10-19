## Programmatic Vulnerability Remediations: STIG Implementations - Win11 (Powershell)

## Introduction

In the world of cybersecurity, maintaining a secure environment is critical for mitigating vulnerabilities that can be exploited by attackers. One of the most widely recognized frameworks for hardening operating systems and applications is the **Security Technical Implementation Guide (STIG)**, which provides detailed configuration guidelines aimed at improving the security posture of IT systems.

STIGs are developed by the **Defense Information Systems Agency (DISA)** and are used primarily by the Department of Defense (DoD) and other federal agencies. These guides contain a series of security requirements designed to mitigate common vulnerabilities, ensure compliance, and reduce the risk of compromise. 

This repository is focused on automating the remediation of **STIGs** on Windows operating systems using **PowerShell scripts**. The scripts are designed to address specific security requirements outlined in each **STIG ID** and can be run in environments that need to adhere to DoD or similar security standards. 

Keep reading to see an example of how I handled a STIG implementation using PowerShell scripts for automation, and also the benefits of using automated remediation vs manual remediation. For detailed information on individual STIGs and their associated remediations, I made use of **[stigaview.com](https://stigaview.com/products/win10/v3r1/)**, a comprehensive resource that provides in-depth insights into each STIG.

---

## Repository Structure

The repository is organized into the following folders:

### 1. **[STIGS folder](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/tree/main/STIGS)**:
- Contains scripts to automate remediation for each STIG.
- Each STIG ID (e.g., **WN10-AU-000500**) has its own corresponding PowerShell script that configures the required settings automatically.

### 2. **[Manual Fix Folder](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/tree/main/Manual%20Fix)**:
- Provides step-by-step instructions for manually applying STIG configurations and **verifying the details** of each setting.
- This folder is helpful for users who want to manually check and apply STIG configurations or prefer to verify settings before making changes, or who want to make the necessary registry or group policy changes without using automation.

### 3. **[Script Test Photos](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/tree/main/Script-Test-Photos)**:
- Contains screenshots showing the **command-line output** after running the PowerShell script to remediate a STIG.
- These screenshots provide **confirmation of success**, showing the successful application of the configuration changes after executing the script.
---

