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


