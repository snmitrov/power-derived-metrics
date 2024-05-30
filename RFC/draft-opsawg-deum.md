---
stand_alone: true
ipr: trust200902
title: Derived Energy Utilization Metrics
abbrev: deum
category: std
consensus: true
submissiontype: IETF
area: operations
workgroup: OPSA Working Group

docname: draft-opsawg-deum-00

lang: en
kw:
  - Internet-Draft

pi:
  - toc
  - sortrefs
  - symrefs

normative:

informative:
  I-D.draft-palmero-ivy-ps-almo-00:
  I-D.draft-opsawg-poweff-01:

author:
-   ins: S. Mitrovic 
    name: Snezana Mitrovic
    organization: Cisco Systems
    email: snmitrov@cisco.com  
-   ins: M. Palmero 
    name: Marisol Palmero
    organization: Cisco Systems
    email: mpalmero@cisco.com


--- abstract 

This paper introduces Derived Energy Utilization Metrics (DEUM), a set of key performance indicators that stem from the analysis of power consumption data across various systems and processes. DEUM offers organizations tools to evaluate energy efficiency, track power usage patterns, and discover potential areas for energy-saving enhancements.

--- middle


# Introduction 

This document introduces the key performance indicatiors and/or Metrics computed by an analytics engine 
##todo add philatelist terminology if agreed upon


## Requirements language

{::boilerplate bcp14}

# Terminology

Terminology and abbreviations used in this document:

Asset
: 

Refers to hardware, software, applications, or services. An asset can be physical or virtual, as defined in the Asset Lifecycle Management and Operations {{?I-D.draft-palmero-ivy-ps-almo-00}} IETF draft.

Scope 1
: 

Emissions directly caused by actions of the organization, such as when fossil fuels are burned when the organization is operating a fossil vehicle. See [Greenhouse Gas protocol](https://ghgprotocol.org/).

Scope 2
: 

Emissions indirectly caused by actions of the organization, but under control of the organization. For example, when electric energy is purchased, causing a provider utility to make emissions on behalf of the organization. See [Greenhouse Gas protocol](https://ghgprotocol.org/).

Scope 3
: 

Emissions the organization indirectly causes others to make, but outside the organizations direct control. Examples include the energy customers consume when operating the organization's products, or when employees commute to work at the organization. See [Greenhouse Gas protocol](https://ghgprotocol.org/).

Scope 4
:

Refers to the term used in Greenhouse Gas (GHG) accounting and reporting to describe emissions that occur as a result of an organization's value chain activities, but are not directly controlled or owned by the organization. Scope 4 emissions are considered indirect emissions and are typically associated with activities that are upstream or downstream from a organization's operations. Such as when equipment provided by the organization enables a video conference, without which greater emissions from business travel would have happened.

CO2eq
: 

Carbon dioxide equivalents, a measure of the disruptive force of greenhouse gas emissions.

Power
: 

Refers to the electrical energy per unit time, supplied to operate an asset, such as a smartphone. It is usually measured in units of watts. 

Energy Efficiency
: 

refers to the ability of an asset to perform its intended functions while minimizing energy consumption. It refers to the ratio between the useful output energy and input energy given by an asset. In a router or a switch, it is a measure of how efficiently the network element utilizes energy resources to transmit and process data or perform other network-related tasks. See [Energy efficiency wikipedia](https://en.wikipedia.org/wiki/Energy_efficiency).



# Motivation

The primary focus of this document is to introduce Derived Energy Utilization Metrics (DEUM), which are  indicators for monitoring energy consumption and its impact on CO2 equivalent emissions. These metrics are crucial for understanding the energy efficiency of assets during their use phase as outlined by the GHG Protocol Accounting and Reporting Standard, consistent with ISO 14040:44 standards. DEUM specifically targets the emissions associated with the use of goods and services, encompassing both the direct emissions (Scope 1) and indirect emissions (Scope 2) of end users, which are reported under Scope 3 category 11. This category often represents a significant portion of the total emissions reported by an asset.


# Use Cases

- to be covered in separate document 


# Information Model 



# Data Models

## Overview

       container power-derived {
         config false;
         description "power consumption per working day";
         leaf power consumption per working day {
           type string;
           description
             "It used by an entity (such as an organization, a piece of equipment, or a facility) during the days when it is operational or during standard business hours. This metric can be particularly useful for businesses looking to measure and manage their energy usage more effectively, as it provides a normalized basis for comparing energy consumption across different periods or working conditions.;
         }
         leaf power consumption per non-working day {
           type string;
           description
             "It used by an entity (such as an organization, a piece of equipment, or a facility) during the days when it is not operational. This metric can be particularly useful for businesses looking to measure and manage their energy usage more effectively, as it provides a normalized basis for comparing energy consumption across different periods or working conditions.;
         }
          leaf power consumption per working hours {
           type string;
           description
             "This metric is useful for understanding energy consumption during active operational periods. It allows for a more granular analysis of energy efficiency by focusing solely on the times when the facilities or equipment are in use for work-related activities.;
         }
         leaf power consumption per non-working hours {
           type string;
           description
             "This metric is useful for understanding energy consumption during non active operational periods such as evenings, nights, weekends, or holidays, depending on the organization's schedule. It allows for a more granular analysis of energy efficiency by focusing solely on the times when the facilities or equipment are in not use for work-related activities.;
         }
          leaf device-to-poe power ratio {
           type string;
           description
             "This metric quantifies the proportion of power consumed by Power over Ethernet (PoE) ports in relation to the total power consumption of the networking device. This ratio helps assess the energy efficiency of PoE port usage and the power distribution within the device.;
         }
         leaf heat-dissipation {
           type string;
           description
             "It refers to Heat Transfer, i.e. heat transferred from
             hotter object to coolerobject (1W = 3.412BTU/h)";
         }
         leaf rated-input-pwr-value {
           type string;
           mandatory "true";
           description
             "Total Input Power for the chassis and specific inventory
             inside. The sum for all assets for specific hardware
             configuration. Can be calculated for Typical, Operating, or
             Maximum anticipated Capacity Load. Mainly used for
             dimensioning based on benchmark data";
         }
         leaf asset-input-pwr {
           type string;
           mandatory "true";
           description
             "For a given asset, assumed input power means the rate of
             electricity consumption in Watts provided by the network
             device or sensor. Conditionally derived - if
             the device/sensor can give actual power draw then this
             calculation is not required, and will be taken directly
             from the sensor.";
         }
         leaf asset-output-pwr {
           type string;
           description
             "Watts provided to the internal components for a given
             asset. Only applicable to assets that provide output power,
             such as PSUs. This is present here to accommodate chassis
             that don’t provide Watt value currently. Ideal
             implementation should provide Pout sensor reading";
             //FIXME: add condition this is mandatory for when asset is
             //chassis or PSU and not LC or Port;
         }
         leaf  psu-input-power {
           type string;
           mandatory "true";
           description
             "Total input power per chassis, rate of the electricity
             consumption in Watts. Sum of asset-input-pwr when uid=PSU.
             It considers all operational PSU'́s to the chassis";
         }
         leaf psu-output-power {
           type string;
           mandatory "true";
           description
             "Total input power for chassis, rate of the electricity
             consumption inWatts. Sum of asset-output-pwr when uid=PSU.
             It considers alloperational PSU's to the chassis";
         }
         leaf psu-pwr-ratio {
           type string;
           mandatory "true";
           description
             "Define dynamic (current) power ratio taking into
             consideration total system real power input vs used. Not
             expected to be the same as PSU efficiency. Formula:
             (psu-output-power / psu-input-power) * 100.0.
             It considers all operational PSU ́s to the chassis.";
         }
         leaf energy-traffic-ratio {
           type string;
           mandatory "true";
           description
             "How much Watts is spent to move 100Gigaytes per
             chassis within thetime period; Formula:
             psu-output-power [Watt] /SUM of all interfaces
             (input-data-rate-bits + output-data-rate-bits).
             Measured over a period of 1hr. energy-traffic-ratio is
             the value considered for the complete chassis and all
             operational LC ́s/interfaces.";
         };
         }




## Tree Diagrams of DEUM modules




## YANG data models of DEUM modules



# Deployment Considerations




# Security Considerations

The security considerations mentioned in section 17 of {{?RFC7950}} apply.

DEUM brings several security and privacy implications because of the various components and attributes of the information model. For example, each functional component can be tampered with to give manipulated data. DEUM when used alone or with other relevant data, can identify an individual, revealing Personal Identifiable Information (PII). How the configuration of assets should be accomplished could lead to data being accessed by unauthorized entities.

Methods exist to secure the communication of management information. The transport entity of the functional model MUST implement methods for secure transport. This document also contains an Information model and Data-Model in which none of the objects defined are writable. If the objects are deemed sensitive in a particular environment, access to them MUST be restricted using appropriately configured security and access control rights. The information model contains several optional elements which can be enabled or disabled for the purpose of privacy and security. Proper authentication and audit trail MUST be included for all the users/processes that access DEUM data.

##todo - check for PII 

# IANA Considerations

##  The IETF XML Registry

This document registers URIs in the IETF XML registry {{?RFC3688}}. Following the format in {{?RFC3688}}, the registrations defined below are requested:

~~~
URI: urn:ietf:params:xml:ns:yang:ietf-lmo
Registrant Contact: The OPSA WG of the IETF.
XML: N/A, the requested URI is an XML namespace.
~~~

## The YANG Module Names Registry

This document registers YANG modules in the YANG Module Names registry {{?RFC7950}}. Following the format in {{?RFC7950}}, the registrations defined below are requested:

~~~
name: ietf-poweff-environment
namespace: urn:ietf:params:xml:ns:yang:ietf-poweff-environment
maintained by IANA: N
prefix: ietf-poweff-environment
reference: RFC XXXX
~~~

--- back

# Change log
{:numbered="false"}

RFC Editor Note: This section is to be removed during the final publication of the document.

version 00

* Initial version.


# Acknowledgments
{:numbered="false"}


This document was created by meaningful contributions from Per Andersson, Jeff Apcar, Derek Engi, Esther Roure Vila, Pascal Thubert, Klaus Verschure, Joel Goergen, Colin Seward, Michael King, Angelo Fienga and Suresh Krishnan.

The authors wish to thank them and many others for their helpful comments and suggestions.



