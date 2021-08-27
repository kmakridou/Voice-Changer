function pass = password(varargin)% PASSWORDUI  Dialog for entering and creating passwords%   PW = PASSWORDUI() brings up a dialog for entering a password.%       The dialog masks the characters with a "*".%   PW = PASSWORDUI(...) accepts up to 3 optional input arguments. The%       arguments can be:%       MODE - 'Query' or 'Create'. 'Query' asks the user to type the%              password. 'Create' asks the user to create a new password.%              This requires the user to type the password twice. Default%              is 'Query'.%       MIN  - a positive number that indicates the minimum number of%              characters the password should have. This is only used when%              the MODE is 'Create'. Default is 5.%       TYPE - 'NumOnly', 'AlphaNum'.%              Restricts the type of password when the MODE is 'Create'.%              Default is 'NumOnly'.%                'NumOnly'   - Only numbers.%                'AlphaNum'  - Must have both alphabets and numbers but no%                              special characters.%%   Examples:%       pw = passwordUI()%       pw = passwordUI('Create', 'AlphaNum')%       pw = passwordUI('Create', 'NumOnly', 8)% Version History:%   1.0 - Oct 2010.% Jiro Doke% Copyright 2010 The MathWorks, Inc.error(nargchk(0, 3, nargin, 'struct'));% Defaultspass_mode = 'Query';pass_length= 5;pass_type = 'AlphaNum';% Process input argumentsfor id = 1:nargin    if ischar(varargin{id})        val = validatestring(varargin{id}, ...            {'Query', 'Create', 'NumOnly', 'AlphaNum', ...             });        switch val            case {'Query', 'Create'}                pass_mode = val;            case {'NumOnly', 'AlphaNum'}                pass_typeype = val;        endswitch    elseif isnumeric(varargin{id})        validateattributes(varargin{id}, {'numeric'}, ...            {'scalar', 'integer', 'positive'}, mfilename, 'MIN_CHAR');        pass_length = varargin{id};    else        error(['Invalid input arguments. Arguments must be a number ', ...            '(minimum number of characters), ''Query'', ''Create'' ', ...            '(UI mode),''NumOnly'', ''AlphaNum'', ', ...            '(password type)']);    endifendfori = 1;flag = false;while true    if strcmp(pass_mode, 'Query')      % Query Mode        dialogTitle = 'Enter Password:';            else                            % Create Mode        if i == 1     % First Try            dialogTitle = sprintf('Create Password: %s', pass_type);        else            % Re-type            dialogTitle = sprintf('Retype Password: %s', pass_type);        endif    endif        fh = figure(...        'Visible', 'off', ...        'Name', dialogTitle, ...        'NumberTitle', 'off', ...        'Units', 'Pixels', ...        'Position', [0, 0, 500, 50], ...        'Toolbar', 'none', ...        'Menubar', 'none', ...        'CloseRequestFcn', @closing, ...        'WindowStyle', 'modal', ...        'KeyPressFcn', @keypress);        th = uicontrol(...        'Style', 'edit', ...        'Units', 'Pixels', ...        'Position', [10, 10, 480, 30], ...        'BackgroundColor', 'white', ...        'Enable', 'inactive', ...        'String', '_', ...        'FontName', 'FixedWidth', ...        'FontSize', 10);        movegui(fh, 'center');    set(fh, 'Visible', 'on');        % Default password    pass = '';        uiwait(fh);    drawnow;        if flag        pass = '';        break;    elseif strcmp(pass_mode, 'Query')        % "password" already has the characters        break;    else        if i == 1  % First time through            if isempty(pass)                return;            endif                        % Make sure the valid characters were typed            s = validPass();            if s   % if so, save that, and go to "retype"                password = pass;                i = 2;            endif        else         % Retype            % Check to see if the two passwords match            if isequal(pass, password)% if so, break (OK)              pass = password;                break;            else   % if not, notify that they did not match, and go back to first try                uiwait(warndlg('The passwords do not match. Try again!', 'Error', 'modal'));                i = 1;            endif        endif    endif    endwhile%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Nested Functions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--------------------------------------------------------------------------    function closing(obj, edata) %#ok<INUSD>        flag = true;        delete(obj);    endfunction%--------------------------------------------------------------------------    function succeed = validPass()        succeed = false;                % Check password length        if length(pass) < pass_length            uiwait(warndlg(sprintf('The password must be at least %d characters long.', pass_length), 'Error', 'modal'));            return;        endif                % Check valid use of characters        switch pass_type            case 'NumOnly'          % Only numbers                if ~all(isstrprop(pass, 'digit'))                    uiwait(warndlg('The password must be all numbers.', 'Error', 'modal'));                    return;                endif            case 'AlphaNum'         % Alphabets and numbers                if ~all(isstrprop(pass, 'alphanum')) || ...                        ~(any(isstrprop(pass, 'alpha')) && any(isstrprop(pass, 'digit')))                    uiwait(warndlg('The password must have alphabets and numbers.', 'Error', 'modal'));                    return;                endif        endswitch        succeed = true;    endfunction%--------------------------------------------------------------------------    function keypress(obj, edata)        switch edata.Key            case 'return'                delete(obj);                return;            case 'escape'                flag = true;                delete(obj);                return;            case {'backspace', 'delete'}                if ~isempty(pass)                    pass(end) = '';                end            otherwise                c = edata.Character;                if ~isempty(c)                    if c >= '!' && c <= '}'                        pass = [pass, c];                    else                        disp('Unrecognized character');                    endif                endif        endswitch        set(th, 'String', [repmat('*', 1, length(pass)), '_']);    endfunction%------------------------------------------------------------------------------------endfunction