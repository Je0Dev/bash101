#!/bin/bash

# Προεπιλεγμένες τιμές
BETA_VAL=40
LAMDA_VAL=40


# Σημαίες ελέγχου  για να δούμε αν τέθηκαν οι επιλογές
ALPHA_SET=0
BETA_SET=0
KAPPA_SET=0
LAMDA_SET=0

# Έλεγχος για μηδενικά ορίσματα
if [ $# -eq 0 ]; then
    echo "Λάθος: Πρέπει να δώσετε τουλάχιστον μία επιλογή." >&2
    exit 1
fi

# Parsing ορισμάτων με loop
while [ "$1" != "" ]; do
    case $1 in
        -a | --alpha )
            ALPHA_SET=1
            shift # Μετακίνηση στο επόμενο όρισμα
            ;;
        -b | --beta )
            BETA_SET=1
            shift # Μετακίνηση για να δούμε την τιμή
            # Έλεγχος αν το επόμενο όρισμα ΔΕΝ είναι επιλογή ή κενό
            if [[ "$1" != -* && "$1" != "" ]]; then
                BETA_VAL=$1
                shift # Κατανάλωση της τιμής
            fi
            ;;
        -k | --kappa )
            KAPPA_SET=1
            shift
            ;;
        -l | --lamda )
            LAMDA_SET=1
            shift # Μετακίνηση για να δούμε την τιμή
            if [[ "$1" != -* && "$1" != "" ]]; then
                LAMDA_VAL=$1
                shift # Κατανάλωση της τιμής
            fi
            ;;
        * )
            echo "Άγνωστη επιλογή: $1" >&2
            exit 1
            ;;
    esac
done

# Έλεγχος υποχρεωτικής επιλογής (-b ή -l)
if [ $BETA_SET -eq 0 ] && [ $LAMDA_SET -eq 0 ]; then
    echo "Πρέπει να δώσετε τουλάχιστον μία από τις επιλογές -b ή -l." >&2
    exit 1
fi

# Εκτύπωση αποτελεσμάτων
echo "Επιλογές:"
if [ $ALPHA_SET -eq 1 ]; then
    echo "--alpha/-a: Επιλέχθηκε"
fi
if [ $KAPPA_SET -eq 1 ]; then
    echo "--kappa/-k: Επιλέχθηκε"
fi
if [ $BETA_SET -eq 1 ]; then
    echo "--beta/-b: $BETA_VAL"
fi
if [ $LAMDA_SET -eq 1 ]; then
    echo "--lamda/-l: $LAMDA_VAL"
fi
