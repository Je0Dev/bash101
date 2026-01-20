#!/bin/bash

# Ελέγχει αν δόθηκαν 2 ορίσματα
if [ "$#" -ne 2 ]; then
    echo "Χρήση: ./askisi1b.sh <Όνομα> <Επώνυμο>"
    exit 1
fi

# Παίρνει τα ορίσματα
onoma=$1
eponymo=$2
host_name=$(hostname)

# Εκτυπώνει το μήνυμα
echo "Το ονοματεπώνυμό σας είναι: $onoma $eponymo. Αυτό το σενάριο εκτελείται στον $host_name."
