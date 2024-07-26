#!/bin/bash

# Test version to run shell without dmenu //Nicklas

# Dependencies:
# - jq
# - curl
# - mpv
# - notify-send

# Function to search for podcasts
search_podcasts() {
    local query=$1
    curl -s "https://api.sr.se/api/v2/episodes/search?query=${query}&format=json&size=5" | jq -r '.episodes[] | "\(.program.name) - \(.title) - \(.id)"'
}

# Function to get podcast URL
get_podcast_url() {
    local episode_id=$1
    curl -s "https://api.sr.se/api/v2/episodes/get?id=${episode_id}&format=json" | jq -r '.episode.listenurl'
}

# Prompt for search query
read -p "Enter search term: " search_query

# Get the search results
results=$(search_podcasts "$search_query")

# Check if there are results
if [ -z "$results" ]; then
    echo "No results found for '$search_query'."
    exit 1
fi

echo "Search Results:"
echo "$results"

# Prompt for episode selection
read -p "Enter the episode ID to play (or type 'exit' to quit): " episode_id

# Handle exit case
if [ "$episode_id" == "exit" ]; then
    exit 0
fi

# Extract the ID from the user input
episode_id=$(echo "$results" | grep -E "$episode_id" | awk -F' - ' '{print $3}')

# Check if the episode ID was found
if [ -z "$episode_id" ]; then
    echo "Invalid episode ID selected."
    exit 1
fi

# Get the podcast URL
url=$(get_podcast_url "$episode_id")

# Check if the URL is empty
if [ -z "$url" ]; then
    echo "No URL found for episode ID $episode_id."
    exit 1
fi

# Notify and play the podcast
notify-send "Playing podcast" "Episode ID $episode_id" -t 5000
mpv "$url"

# Check if mpv was successful
if [ $? -ne 0 ]; then
    echo "Failed to play the podcast. Please check if the URL is correct."
fi
