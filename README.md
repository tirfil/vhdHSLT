# vhdHSLT
High Speed Link Test POC

Goal is to test an implementation of a data link.

In transmit part the data are encoded with Manchester coding.

Manchester coding will enable receiving part to extract data and clock.  

Manchester coding is also removed in receiving part.


__


To test the data link, I use a LFSR 17 bit to inject data in the transmit part.

In receiving part, I check that the data receiving are coming from the LFSR (taps are 17 and 14).

If an error is detected, a LED is on during 250 ms.


__


An implementation is done with two EP2C5T144C8 (Altera cyclone II).

![Image1](https://github.com/tirfil/vhdHSLT/blob/master/IMAGE/CIMG0033.JPG)

![Image1](https://github.com/tirfil/vhdHSLT/blob/master/IMAGE/testlinkpinout.png)

LED is active low. So LED is on when no error is detected.

Data link use differential pads (LVDS).

Data is generated at 25 MHz.

After Manchester coding, data link frequency is 50 MHz.

Data and clock extraction is performed at 200 MHz (use of PLL X4)

After Manchester decoding frequency is back to 25 MHz.

__


