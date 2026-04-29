classdef Customer < handle
    % Customer Representation of a customer.
    %
    % It's a handle class because ServiceQueue needs to change its state to
    % record when the Customer arrived, was served, and departed.

    properties
        
        % Id - Every customer has a unique identification number.
        % These are assigned sequentially.
        Id;

        % ArrivalTime - The time at which this customer arrived in the
        % queue system.  This time is assigned in ServiceQueue's
        % handle_arrival method.
        ArrivalTime;

        % BeginServiceTime - The time at which this customer got out of
        % line and entered a serving station.  This time is assigned in
        % ServiceQueue's begin_serving method.
        BeginServiceTime;

        % DepartureTime - The time at which this customer left the serving
        % station.  This time is assigned in ServiceQueue's
        % handle_departure method.
        DepartureTime;
    end

    methods
        function obj = Customer(Id, ArrivalTime, BeginServiceTime, DepartureTime)
            % Customer - Construct a Customer.
            %
            % obj = Customer() - The default properties are 0 for Id, and
            % Inf for the various times.
            arguments
                Id = 0;
                ArrivalTime = Inf;
                BeginServiceTime = Inf;
                DepartureTime = Inf;
              

            end
            obj.Id = Id;
            obj.ArrivalTime = ArrivalTime;
            obj.BeginServiceTime = BeginServiceTime;
            obj.DepartureTime = DepartureTime;
        end
    function handle_renege(obj, event)
    for i = 1:length(obj.Waiting)
        if obj.Waiting{i}.Id == event.CustomerId
            % Still waiting → valid reneging
            reneging_customer = obj.Waiting{i};
            obj.Reneged{end+1} = reneging_customer;
            obj.Waiting(i) = [];
            return;
        end
    end
    % If not found → ignore (already in service or gone)
end
    end
end