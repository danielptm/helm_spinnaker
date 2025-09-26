#!/bin/bash

# Define the list of options
options=("default" "helm-spin", "Quit")

# Function to display the options and let the user select
select_option() {
    echo "Please choose an option using arrow keys and press Enter:"
    PS3="Select an option: "

    select option in "${options[@]}"; do
        if [[ -n "$option" ]]; then
            # Check if the option is Quit (case-insensitive)
            if [[ "$option" =~ ^[Qq]uit$ || "$option" == "Q" || "$option" == "q" ]]; then
                echo "Exiting program..."
                exit 0
            else
                selected_option="$option"
                kubectl config set-context --current --namespace="$selected_option"
                echo "namespace selected..."
                kubectl config view --minify --output 'jsonpath={..namespace}'
                echo ""
                echo "exiting..."
                echo ""
                break
            fi
        else
            echo "Invalid option. Try again."
        fi
    done
}

# Run the function
select_option

