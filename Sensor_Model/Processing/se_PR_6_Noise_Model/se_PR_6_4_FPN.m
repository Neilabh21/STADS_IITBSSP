function se_Image_Mat = se_PR_6_4_FPN(se_Image_Mat, se_er)
    % Fixed Pattern Noise for the Sensor Model
    %   This function adds the Fixed Pattern Noise into the Image Matrix
    %
    % -----------
    % References:
    % -----------
    %
    % Fixed Pixel Noise in LSB10 is the non - uniformity in spatial 
    % variation of Pixel Values, independent of illumination (DSNU)
    % This is the standard deviation value.
    %
    % http://isl.stanford.edu/~abbas/ee392b/lect07.pdf
    % http://caeleste.be/wp-content/uploads/2018/05/MS-thesis-characterization.pdf
    %
    % -----------
    % Parameters:
    % -----------
    %
    % se_Image_Mat: (Array (1024, 1280))
    %   Image Matrix without FPN
    %   Comments:
    %   - Each pixel value is 10 Bits, i.e. 0 to 1023
    %
    % se_er: (Structure)
    %   The Sensor Model Error Constants. MUST contain:
    %   - se_er.FPN     (Double)
    %       Fixed Pixel Noise
    %
    % --------
    % Returns:
    % --------
    %
    % se_Image_Mat: (Array (1024, 1280))
    %   Updated Image Matrix containing FPN
    %   Comments:
    %   - Each pixel value is 10 Bits, i.e. 0 to 1023
    
    % =====
    % Code:
    % =====
    
    % Define the pseudo-random generator used
    rng(se_er.rng_Seed);
    
    % Add FPN to the image
    se_Image_Mat = se_Image_Mat + se_er.FPN * randn(size(se_Image_Mat));
end

