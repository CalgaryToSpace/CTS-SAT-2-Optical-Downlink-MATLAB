$$
LM = P_{rx} - P_{req}
$$

where: 
<br>
$P_{rx}$ is the received signal power in dB. <br>
$P_{req}$ is the required signal power to achieve a specific bit error rate (BER) at a given data rate in dBm. <br> <br>

$$
P_{rx} = P_{tx} + OE_{tx} + OE_{rx} + G_{tx} + G_{rx} - LP_{tx} - LP_{rx} - L_{PG} - L_{abs} - L_{sca}
$$

where: 
<br>
$P_{tx}$ is the transmitted power in dB.<br>
$OE_{tx}$ is the transmitter optical efficiency in dB, which was set to 0.8. (I'm not too sure about this value) <br>
$OE_{rx}$ is the receiver optical efficiency in dB, which was set to 0.8.<br>
$G_{tx}$ is the transmitter gain in dB.<br>
$G_{rx}$ is the receiver gain in dB.<br>
$LP_{tx}$ is the transmitter pointing loss in dB.<br>
$LP_{rx}$ is the receiver pointing loss in dB.<br>
$L_{PG}$ is the free-space path loss between ground and satellite in dB. Think of it as a loss in signal strength as it spreads over a larger area. <br>
$L_{abs}$ is the atmospheric attenuation loss due to absorption in dB. <br>
$L_{sca}$ is the atmospheric attenuation loss due to scattering in dB. This simulation only accounts for Mie and geometrical scattering.
<br> <br>
Free path loss is calculated by the following:
<br> <br>
$L_{PG} = 20log_{10} (\frac{4\pi d_{GS}}{\lambda})$ <br> <br>
where $d_{GS}$ is the line-of-sight distance between the ground station and satellite. This was computed using the *slantRangeCircularOrbit* function, which assumes a circular orbit. <br>
<br>
The atmospheric attenuation loss due to absorption is obtained from the following [^1]: <br>
<img width="1475" height="1218" alt="image" src="https://github.com/user-attachments/assets/7c9f85ea-2b1b-4c16-9c04-0e3f1b230fde" /> <br>
For the simulation, I assumed a wavelength of 0.850 $\micro m$ and absorption loss of 0.8, however, in the MATLAB tutorial, they used a wavelength of 1.550 $\micro m$ and absorption loss of 0.01.
<br><br>
The loss due to Mie and geometrical scattering is obtained by the following:
<br><br>
$L_{sca} = L_{geo} + L_{mie}$
<br><br>
Geometrical scattering, $L_{geo}$, occurs when the particles are much larger than the signal wavelength. On the other hand, Mie scattering, $L_{mie}$, occurs when particles are roughly the same size as the wavelength. Rayleigh scattering was not included in the tutorial, however, it would be present if the signal encounters particles much smaller than its wavelength. The full method of getting the geometrical and Mie scattering is in the MATLAB tutorial [^2]. Note that this method is only valid for ground stations with elevations between 0 and 5km above sea level and wavelengths between 0.8 and 2 $\micro m$. For elevation angles greater than 45 $\degree$, this method is accurate to within approximately 0.1dB.



[^1]: International Telecommunication Union Radiocommunication Sector (ITU-R). Propagation data required for the design of Earth-space systems operating between 20 THz and 375 THz. Recommendation ITU-R P.1621-2 (07/2015). [https://www.itu.int/rec/R-REC-P.1621-2-201507-I/en]
[^2]: Optical Satellite Communication Link Budget Analysis. MATLAB & Simulink. (n.d.). [https://www.mathworks.com/help/satcom/ug/optical_satellite_communication_link_budget_analysis.html#mw_rtc_OpticalLinkBudgetAnalysisExample_M_0FB6C070]
