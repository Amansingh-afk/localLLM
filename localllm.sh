#!/bin/bash

# Function to display custom help message
function display_help() {
    echo "LocalLLM runner"
    echo ""
    echo "Usage:"
    echo "  localllm [flags]"
    echo "  localllm [command]"
    echo ""
    echo "Available Commands:"
    echo "  serve       Start localllm services"
    echo "  kill        Stop localllm services"
    echo "  pull        Pull a model from a registry"
    echo "  run         Run a model"
    echo "  stop        Stop a running model"
    echo "  create      Create a model from a Modelfile"
    echo "  show        Show information for a model"
    echo "  list        List models"
    echo "  ps          List running models"
#   echo "  cp          Copy a model"
    echo "  rm          Remove a model"
    echo "  help        Help about any command"
    echo ""
    echo "Flags:"
    echo "  -h, --help      help for localllm"
    echo "  -v, --version   Show version information"
    echo ""
    echo "Use \"localllm [command] --help\" for more information about a command."
}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    display_help
    exit 1
fi

COMMAND=$1
shift

# Get the directory of the original script (resolving symlink)
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"

# Change to the directory where the docker-compose.yml file is located
DOCKER_COMPOSE_DIR="$SCRIPT_DIR"  # Assuming docker-compose.yml is in the same directory as the script
cd "$DOCKER_COMPOSE_DIR" || { echo "Directory not found: $DOCKER_COMPOSE_DIR"; exit 1; }

case $COMMAND in
    serve)
        echo "Starting the localllm services..."
        docker compose start
        ;;
    kill)
        echo "Stopping the localllm services..."
        docker compose stop
        ;;
    help)
        display_help
        ;;
    *)
        # Forward all other commands to ollama
        docker compose exec localllm-engine ollama "$COMMAND" "$@"
        ;;
esac
