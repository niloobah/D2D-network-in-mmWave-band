# D2D-network-in-mmWave-band
This MATLAB code simulates a PPP wireless communication in the millimeter wave band (@28 GHz)
signal-to-interference-plus-noise ratio (SINR) coverage probability, 
which is prob[SINR>T]. The network elements are distributed based on 
Poisson Point Process (PPP) distribution.
Networks elements are:

1- D2D transmitters (interferes)
2- Blockages (length, width, and orientation of the blockages are generated based on the uniform distribution)
3- The reference receiver located at the origin o(0,0)
 - The performance of the reference users is measured,  
 Based on the Slyvniak theorem this measures the whole network performance.
- To average out noise the simulation is repeated for 3000 iterations.
- The analytical formulation and details of the network can be found in
[1] Device-to-device communications in the millimeter wave band:
https://ieeexplore.ieee.org/abstract/document/8363940/
