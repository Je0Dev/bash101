#!/bin/bash

# Το path του αρχείου
file_path="/home/mastroni/Root/green/indigo/red/blue/f5" # αυτό αλλάζουμε κάθε φορά για τις 3 περιπτώσεις που ζητούνται

echo "Έλεγχος για το αρχείο: $file_path"

# α. Έλεγχος αν υπάρχει το αρχείο σε απόλυτη διαδρομή
if [ -f "$file_path" ]; then
  echo "Το αρχείο: «$file_path» υπάρχει στη διαδρομή: «$(realpath "$file_path")»"
  
  # β. Έλεγχος για δικαίωμα εγγραφής
  if [ -w "$file_path" ]; then
    echo "Έχετε δικαιώματα να επεξεργαστείτε το αρχείο: «$file_path»."
  else
    echo "Δεν έχετε δικαιώματα να επεξεργαστείτε το αρχείο: «$file_path»."
  fi
  
else
  echo "Το αρχείο: «$file_path» ΔΕΝ υπάρχει."
fi
