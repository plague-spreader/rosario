#! /bin/bash
#############

giorno_settimana=$(date +%u)
recita="espeak -vit"
if [[ uname == 'Darwin' ]]; then recita="say"; fi

if [ $giorno_settimana -eq 1 -o $giorno_settimana -eq 6 ]; then
    # misteri gaudiosi
    tipi_misteri="gaudioso"
    misteri="l'Arcangelo Gabriele visita Maria.;Maria visita Santa Elisabetta.;Gesù nasce a Betlemme.;Gesù è presentato al Tempio.;Gesù è ritrovato nel Tempio."
elif [ $giorno_settimana -eq 2 -o $giorno_settimana -eq 5 ]; then
    # misteri dolorosi
    tipi_misteri="doloroso"
    misteri="Gesù prega .e suda sangue nell'Orto degli Ulivi.;Gesù è crudelmente flagellato.;Gesù è coronato di spine e insultato.;Gesù è caricato della croce e percorre le vie del Calvario;Gesù muore crocifisso."
elif [ $giorno_settimana -eq 3 -o $giorno_settimana -eq 7 ]; then
    # misteri gloriosi
    tipi_misteri="glorioso"
    misteri="Gesù risorge da morte.;Gesù ascende al Cielo.;lo Spirito Santo scende sugli Apostoli e su di Maria.;Maria è assunta in Cielo.;Maria è incoronata Regina del Cielo e della Terra."
elif [ $giorno_settimana -eq 4 ]; then
    # misteri luminosi
    tipi_misteri="luminoso"
    misteri="Gesù è battezzato nel fiume Giordano.;Gesù partecipa alle nozze di Cana.;viene annunciato il Regno di Dio.;Gesù trasfigura sul monte Tabor.;viene istituita l'Eucaristia."
else
    echo "WTF";
    exit 1;
fi

$recita "Oh Dio vieni a salvarmi. Signore vieni presto in mio aiuto. Gloria al Padre, al Figlio e allo Spirito Santo. Com'era nel principio ora e sempre nei secoli dei secoli. Amen. Lodato sempre sia il Santissimo nome di Gesù, Giuseppe e Maria. Maria Regina della Pace regna per noi e per il mondo intero. E che regni la Pace nelle famiglie. Oh Gesù mio, perdona le nostre colpe, preservaci dal fuoco dell'Inferno, porta in Cielo tutte le anime specialmente le più bisognose della tua Misericordia."

i=1
IFS=";"
for mistero in $misteri; do
    if [ $i -eq 1 ]; then
        ordinale="primo";
    elif [ $i -eq 2 ]; then
        ordinale="secondo";
    elif [ $i -eq 3 ]; then
        ordinale="terzo";
    elif [ $i -eq 4 ]; then
        ordinale="quarto";
    elif [ $i -eq 5 ]; then
        ordinale="quinto";
    else
        echo "WTF";
        exit 1;
    fi
    IFS=$' \t\n'
    $recita "Nel $ordinale mistero $tipi_misteri $mistero";
    $recita "Padre nostro, che sei nei cieli, sia santificato il tuo nome, venga il tuo regno, sia fatta la tua volontà, come in cielo così in terra. Dacci oggi il nostro pane quotidiano, e rimetti a noi i nostri debiti come noi li rimettiamo ai nostri debitori, e non ci indurre in tentazione, ma liberaci dal male. Amen."
    for j in $(seq 1 10); do
        $recita "Ave, o Maria, piena di grazia, il Signore è con te. Tu sei benedetta fra le donne e benedetto è il frutto del tuo seno, Gesù. Santa Maria, Madre di Dio, prega per noi peccatori, adesso e nell'ora della nostra morte. Amen.";
    done
    $recita "Gloria al Padre, al Figlio e allo Spirito Santo. Com'era nel principio ora e sempre nei secoli dei secoli. Amen. Lodato sempre sia il Santissimo nome di Gesù, Giuseppe e Maria. Maria Regina della Pace regna per noi e per il mondo intero. E che regni la Pace nelle famiglie. Oh Gesù mio, perdona le nostre colpe, preservaci dal fuoco dell'Inferno, porta in Cielo tutte le anime specialmente le più bisognose della tua Misericordia."
    let i=i+1;
    IFS=";"
done
IFS=$' \t\n'

$recita "Salve, Regina, Madre di misericordia; vita, dolcezza e speranza nostra, salve. A Te ricorriamo, noi esuli figli di Eva; a Te sospiriamo, gementi e piangenti in questa valle di lacrime. Orsù dunque, avvocata nostra, rivolgi a noi gli occhi tuoi misericordiosi. E mostraci, dopo questo esilio, Gesù, il frutto benedetto del Tuo seno. O clemente, o pia, o dolce Vergine Maria!"

$recita "Signore, pietà. Cristo, pietà. Signore, pietà. Cristo, ascoltaci. Cristo, esaudiscici. Padre del Cielo, che sei Dio; Abbi pietà di noi. Figlio, Redentore del mondo, che sei Dio; Abbi pietà di noi. Spirito Santo, che sei Dio; Abbi pietà di noi. Santa Trinità, unico Dio; Abbi pietà di noi. Santa Maria, prega per noi. Santa Madre di Dio, prega per noi. Santa Vergine delle vergini, prega per noi. Regina della pace, prega per noi. Santa sposa del giusto Giuseppe, prega per noi. Madre di Cristo, prega per noi. Madre della Chiesa, prega per noi. Regina della pace, prega per noi. Madre della divina grazia, prega per noi. Madre purissima, prega per noi. Madre castissima, prega per noi. Regina della pace, prega per noi. Madre sempre vergine, prega per noi. Madre immacolata, prega per noi. Madre degna d'amore, prega per noi. Regina della pace, prega per noi. Madre ammirabile, prega per noi. Madre del buon consiglio, prega per noi. Madre del Creatore, prega per noi. Regina della pace, prega per noi. Madre del Salvatore, prega per noi. Madre di misericordia, prega per noi. Vergine prudentissima, prega per noi. Regina della pace, prega per noi. Vergine degna di onore, prega per noi. Vergine degna di ogni lode, prega per noi. Vergine potente, prega per noi. Regina della pace, prega per noi. Vergine clemente, prega per noi. Vergine fedele, prega per noi. Specchio della santità divina, prega per noi. Regina della pace, prega per noi. Sede della Sapienza, prega per noi. Causa della nostra letizia, prega per noi. Tempio dello Spirito Santo, prega per noi. Regina della pace, prega per noi. Tabernacolo dell'eterna gloria, prega per noi. Dimora tutta consacrata a Dio, prega per noi. Rosa mistica, prega per noi. Regina della pace, prega per noi. Torre di Davide, prega per noi. Torre d'avorio, prega per noi. Casa d'oro, prega per noi. Regina della pace prega per noi. Splendore di Grazia, prega per noi. Arca dell'alleanza, prega per noi. Porta del cielo, prega per noi. Regina della pace, prega per noi. Stella del mattino, prega per noi. Salute degli infermi, prega per noi. Rifugio dei peccatori, prega per noi. Regina della pace, prega per noi. Consolatrice degli afflitti, prega per noi. Aiuto dei cristiani, prega per noi. Regina degli Angeli, prega per noi. Regina della pace, prega per noi. Regina dei Patriarchi, prega per noi. Regina dei Profeti, prega per noi. Regina degli Apostoli, prega per noi. Regina della pace, prega per noi. Regina dei Martiri, prega per noi. Regina dei confessori della fede, prega per noi. Regina dei veri cristiani, prega per noi. Regina della pace, prega per noi. Regina delle Vergini, prega per noi. Regina di tutti i Santi, prega per noi. Regina concepita senza peccato originale, prega per noi. Regina della pace, prega per noi. Regina assunta in cielo, prega per noi. Regina del santo Rosario, prega per noi. Regina della famiglia, prega per noi. Regina della pace, prega per noi. Regina dei cuori, prega per noi. Regina Madre della Consolazione, prega per noi. Regina Madre del perpetuo soccorso, prega per noi. Regina della pace, prega per noi."
