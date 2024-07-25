function component = return_element(i)


    switch i

        case 1
            component = 'S_{S}';
        case 2
            component = 'X_{S}';
        case 3
            component = 'X_{BH}';
        case 4
            component = 'X_{BA}';
        case 5
            component = 'S_{O}';
        case 6
            component = 'S_{NO}';
        case 7
            component = 'S_{NH}';
        otherwise
            component = 'none';
    end


end