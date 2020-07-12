function se_T = se_PR_4_Trim2Sensor(se_T, se_op, se_in)
    % Trims the Star Coordinates to within the Sensor Frame
    %   This script trims the table of star coordinates to stars that lie
    %   within the Sensor Frame
    %
    % -----------
    % Parameters:
    % -----------
    %
    % se_T: (Table (n_1, m_1))
    %   The SKY2000 Catalogue Preprocessed for Sensor Model. 
    %   Comments: 
    %   - n_1 - # stars
    %   - m_1 - # fields
    %   - Variable Name -  Sensor_y, Sensor_z
    %
    % se_op: (Structure)
    %   The Constants from Optics. It MUST contain:
    %
    %   - se_op.CMOS (Structure)
    %       CMOS Related Values
    %       - se_op.CMOS.Length     (Double, In Metres)
    %           Length of CMOS in Metres
    %       - se_op.CMOS.Width      (Double, In Metres)
    %           Width of CMOS in Metres
    %
    %
    % se_in: (Structure)
    %   The Sensor Model Constants. MUST contain:
    %   - se_in.Debug_Run (boolean)
    %       Whether or not to display Debug Messages.
    %
    % --------
    % Returns:
    % --------
    %
    % se_T : (Table (n, m_1))
    %   The Updated Table with only the stars within the Sensor Dimensions
    
    % =====
    % Code:
    % =====
    
    % Trim to Sensor Dimensions
    se_T = se_T(se_T.Sensor_y <= + se_op.CMOS.Length / 2, :);
    se_T = se_T(se_T.Sensor_y >= - se_op.CMOS.Length / 2, :);
    se_T = se_T(se_T.Sensor_z <= + se_op.CMOS.Width / 2, :);
    se_T = se_T(se_T.Sensor_z >= - se_op.CMOS.Width / 2, :);
    if (se_in.Debug_Run == 1); disp('Trim to Sensor: Table Modified'); end
    
    % Display Sucess
    fprintf('Trim to Sensor: Success \n \n');
end

