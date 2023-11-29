# Polar Coding and Decoding

This repository contains MATLAB code for encoding and decoding polar codes, a class of error-correcting codes introduced by Arıkan. The project includes implementations for polar encoding, polar decoding using successive cancellation decoding, and various utility functions.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Polar codes are a family of error-correcting codes that achieve the capacity of binary-input memoryless symmetric channels under successive cancellation decoding. This project provides MATLAB implementations for polar encoding, decoding using successive cancellation decoding, and supporting utility functions.

## Project Structure

The project is organized as follows:

- `polar_encoder.m`: MATLAB script for polar encoding.
- `polar_scd_decoder.m`: MATLAB script for polar decoding using successive cancellation decoding.
- `likelihood_cal.m`: MATLAB script for likelihood calculation used in decoding.
- `polar_channel_probs.m`: MATLAB script for calculating channel probabilities in the polar encoding process.
- `master_polar.m`: MATLAB script as a master function for the polar encoder.
- Other utility functions: Various utility functions used in the encoding and decoding processes.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/polar-coding.git

2. Navigate to the project directory:

  cd polar-coding

3. Open MATLAB.

  Run the scripts according to your requirements:
