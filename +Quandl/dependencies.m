function [met, missing] = dependencies(varargin)
    p = inputParser;
    p.addOptional('force',false,@islogical);
    p.parse(varargin{:})
    force = p.Results.force;
    persistent dependencies_met;
    persistent dependencies_missing;
    if size(dependencies_missing) == 0
        dependencies_missing = {};
    end
    if (size(dependencies_met) == 0) | force
        % check dependencies
        dependencies_met = true;
        if ~exist('timeseries')
            dependencies_missing = [ dependencies_missing, 'ts' ];
            dependencies_met = false;
        end
    end

    met = dependencies_met;
    missing = dependencies_missing;
    
end

