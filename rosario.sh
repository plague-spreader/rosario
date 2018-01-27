#! /bin/bash
#############

function usage()
{
    echo    "Uso: $0 [(-h | --help)] [(-c <comando> | --comando-recita=<comando>)] [-g <giorno> | --giorno=<giorno>]"
    echo -e "\t-h | --help                    : mostra questo messaggio."
    echo -e "\t-c <comando>"
    echo -e "\t--comando-recita=<comando>     : usa <comando> per recitare il rosario."
    echo -e "\t-g <giorno>"
    echo -e "\t--giorno=<giorno>              : fai finta che sia <giorno> (da impostare in un formato accettato dal comando date)."
}

# valori di default
giorno_settimana=$(date +%u)
recita="espeak -vit"
if [[ uname == 'Darwin' ]]; then recita="say"; fi

while [ "$1" != "" ]; do
    case $1 in
        -h | --help)
            usage
            exit
            ;;
        -c)
            shift
            recita=$1
            ;;
        --comando-recita=*)
            recita=${1#--comando-recita=}
            ;;
        -g)
            shift
            giorno_settimana=$(date -d "$1" +%u)
            ;;
        --giorno=*)
            giorno_settimana=$(date -d "${1#--giorno=}" +%u)
            ;;
        *)
            # i parametri errati vengono ignorati
            ;;
    esac
    shift
done

if [ ! $(command -v $recita) ]; then
    echo "Il comando \"$recita\" non e' stato trovato."
    exit 2
fi

case $giorno_settimana in
    1|6)
        # misteri gaudiosi
        tipi_misteri="gaudioso"
        misteri="l'Arcangelo Gabriele visita Maria.;Maria visita Santa Elisabetta.;Gesù nasce a Betlemme.;Gesù è presentato al Tempio.;Gesù è ritrovato nel Tempio."
        ;;
    2|5)
        # misteri dolorosi
        tipi_misteri="doloroso"
        misteri="Gesù prega e suda sangue nell'Orto degli Ulivi.;Gesù è crudelmente flagellato.;Gesù è coronato di spine e insultato.;Gesù è caricato della croce e percorre le vie del Calvario;Gesù muore crocifisso."
    ;;
    3|7)
        # misteri gloriosi
        tipi_misteri="glorioso"
        misteri="Gesù risorge da morte.;Gesù ascende al Cielo.;lo Spirito Santo scende sugli Apostoli e su di Maria.;Maria è assunta in Cielo.;Maria è incoronata Regina del Cielo e della Terra."
        ;;
    4)
        # misteri luminosi
        tipi_misteri="luminoso"
        misteri="Gesù è battezzato nel fiume Giordano.;Gesù partecipa alle nozze di Cana.;viene annunciato il Regno di Dio.;Gesù trasfigura sul monte Tabor.;viene istituita l'Eucaristia."
        ;;
    *)
        echo "\"$giorno_settimana\" dev'essere compreso fra 1 e 7."
        exit 255
        ;;
esac

$recita "Oh Dio vieni a salvarmi."
$recita "Signore vieni presto in mio aiuto."
$recita "Gloria al Padre, al Figlio e allo Spirito Santo, com'era nel principio ora e sempre nei secoli dei secoli. Amen."
$recita "Lodato sempre sia il Santissimo nome di Gesù, Giuseppe e Maria."
$recita "Maria Regina della Pace regna per noi e per il mondo intero, e che regni la Pace nelle famiglie."
$recita "Oh Gesù mio, perdona le nostre colpe, preservaci dal fuoco dell'Inferno, porta in Cielo tutte le anime specialmente le più bisognose della tua Misericordia."

i=1
IFS=";"
for mistero in $misteri; do
    case $i in
        1)
            ordinale="primo"
            ;;
        2)
            ordinale="secondo"
            ;;
        3)
            ordinale="terzo"
            ;;
        4)
            ordinale="quarto"
            ;;
        5)
            ordinale="quinto"
            ;;
        *)
            echo "\"$ordinale\" dev'essere compreso fra 1 e 5."
            exit 254
            ;;
    esac
    IFS=$' \t\n' # necessario senno' bash non separa i parametri e considera tutta la stringa un unico blocco
    $recita "Nel $ordinale mistero $tipi_misteri $mistero";
    $recita "Padre nostro, che sei nei cieli, sia santificato il tuo nome, venga il tuo regno, sia fatta la tua volontà, come in cielo così in terra."
    $recita "Dacci oggi il nostro pane quotidiano, e rimetti a noi i nostri debiti come noi li rimettiamo ai nostri debitori, e non ci indurre in tentazione, ma liberaci dal male."
    $recita "Amen."
    for j in $(seq 1 10); do
        $recita "Ave, o Maria, piena di grazia, il Signore è con te."
        $recita "Tu sei la benedetta fra le donne e benedetto è il frutto del tuo seno, Gesù."
        $recita "Santa Maria, Madre di Dio, prega per noi peccatori, adesso e nell'ora della nostra morte."
        $recita "Amen.";
    done
    $recita "Gloria al Padre, al Figlio e allo Spirito Santo, com'era nel principio ora e sempre nei secoli dei secoli. Amen."
    $recita "Lodato sempre sia il Santissimo nome di Gesù, Giuseppe e Maria."
    $recita "Maria Regina della Pace regna per noi e per il mondo intero, e che regni la Pace nelle famiglie."
    $recita "Oh Gesù mio, perdona le nostre colpe, preservaci dal fuoco dell'Inferno, porta in Cielo tutte le anime specialmente le più bisognose della tua Misericordia."
    let i=i+1;
    IFS=";"
done
IFS=$' \t\n'

$recita "Salve, Regina, Madre di misericordia; vita, dolcezza e speranza nostra, salve."
$recita "A Te ricorriamo, noi esuli figli di Eva; a Te sospiriamo, gementi e piangenti in questa valle di lacrime."
$recita "Orsù dunque, avvocata nostra, rivolgi a noi gli occhi tuoi misericordiosi."
$recita "E mostraci, dopo questo esilio, Gesù, il frutto benedetto del Tuo seno."
$recita "O clemente, o pia, o dolce Vergine Maria!"

$recita "Signore, pietà."
$recita "Cristo, pietà."
$recita "Signore, pietà."
$recita "Cristo, ascoltaci."
$recita "Cristo, esaudiscici."
$recita "Padre del Cielo, che sei Dio; Abbi pietà di noi."
$recita "Figlio, Redentore del mondo, che sei Dio; Abbi pietà di noi."
$recita "Spirito Santo, che sei Dio; Abbi pietà di noi."
$recita "Santa Trinità, unico Dio; Abbi pietà di noi."
$recita "Santa Maria, prega per noi."
$recita "Santa Madre di Dio, prega per noi."
$recita "Santa Vergine delle vergini, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Santa sposa del giusto Giuseppe, prega per noi."
$recita "Madre di Cristo, prega per noi."
$recita "Madre della Chiesa, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Madre della divina grazia, prega per noi."
$recita "Madre purissima, prega per noi."
$recita "Madre castissima, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Madre sempre vergine, prega per noi."
$recita "Madre immacolata, prega per noi."
$recita "Madre degna d'amore, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Madre ammirabile, prega per noi."
$recita "Madre del buon consiglio, prega per noi."
$recita "Madre del Creatore, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Madre del Salvatore, prega per noi."
$recita "Madre di misericordia, prega per noi."
$recita "Vergine prudentissima, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Vergine degna di onore, prega per noi."
$recita "Vergine degna di ogni lode, prega per noi."
$recita "Vergine potente, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Vergine clemente, prega per noi."
$recita "Vergine fedele, prega per noi."
$recita "Specchio della santità divina, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Sede della Sapienza, prega per noi."
$recita "Causa della nostra letizia, prega per noi."
$recita "Tempio dello Spirito Santo, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Tabernacolo dell'eterna gloria, prega per noi."
$recita "Dimora tutta consacrata a Dio, prega per noi."
$recita "Rosa mistica, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Torre di Davide, prega per noi."
$recita "Torre d'avorio, prega per noi."
$recita "Casa d'oro, prega per noi."
$recita "Regina della pace prega per noi."
$recita "Splendore di Grazia, prega per noi."
$recita "Arca dell'alleanza, prega per noi."
$recita "Porta del cielo, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Stella del mattino, prega per noi."
$recita "Salute degli infermi, prega per noi."
$recita "Rifugio dei peccatori, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Consolatrice degli afflitti, prega per noi."
$recita "Aiuto dei cristiani, prega per noi."
$recita "Regina degli Angeli, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Regina dei Patriarchi, prega per noi."
$recita "Regina dei Profeti, prega per noi."
$recita "Regina degli Apostoli, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Regina dei Martiri, prega per noi."
$recita "Regina dei confessori della fede, prega per noi."
$recita "Regina dei veri cristiani, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Regina delle Vergini, prega per noi."
$recita "Regina di tutti i Santi, prega per noi."
$recita "Regina concepita senza peccato originale, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Regina assunta in cielo, prega per noi."
$recita "Regina del santo Rosario, prega per noi."
$recita "Regina della famiglia, prega per noi."
$recita "Regina della pace, prega per noi."
$recita "Regina dei cuori, prega per noi."
$recita "Regina Madre della Consolazione, prega per noi."
$recita "Regina Madre del perpetuo soccorso, prega per noi."
$recita "Regina della pace, prega per noi."
