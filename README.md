# LocalLLM Setup Instructions

## Prerequisites

1. **Ensure Docker is Installed**:

## Setup Instructions

1. **Clone the Repository**:
2. **Navigate to the Project Directory**:
   - Change to the directory of the cloned repository:
     ```bash
     cd <repository>
     ```

3. **Run Docker Compose**:
   - Start the services in detached mode:
     ```bash
     docker compose up -d
     ```

4. **Make the `localllm.sh` Script Executable**:
   - Change the permissions of the script to make it executable:
     ```bash
     chmod +x localllm.sh
     ```

5. **Copy the Script to `/usr/local/bin`**:
   - You may need to use `sudo` to copy the script to a directory in your PATH:
     ```bash
     sudo cp localllm.sh /usr/local/bin/localllm
     ```

## Usage

You can now use the `localllm` command from anywhere in your terminal.

 For help, run:   
```bash
    localllm help
```

To start the services, run:
 ```bash
    localllm serve
```

To stop the services, run:
```bash 
    localllm kill
```