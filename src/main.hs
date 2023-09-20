import System.IO
import Data.Maybe (fromJust)
import qualified Data.Map as Map

type Story = Map.Map Int StoryItem

data StoryItem = StoryItem
    { itemText :: String
    , itemOptions :: [(Int, String)]
    }

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "Calouro, está na hora de se matricular!!!"
    playStory story 1

playStory :: Story -> Int -> IO ()
playStory story itemId = do
    let currentItem = fromJust $ Map.lookup itemId story
    putStrLn $ itemText currentItem
    putStrLn "Escolha uma opção:"
    mapM_ (\(optKey, optText) -> putStrLn $ show optKey ++ ": " ++ optText) (itemOptions currentItem)
    choice <- getLine
    let choiceInt = read choice
    case Map.lookup choiceInt story of
        Just nextItem -> playStory story choiceInt
        Nothing -> case itemOptions currentItem of
            [] -> putStrLn "Fim da história." >> return () -- Encerra o programa aqui
            _ -> putStrLn "Opção inválida." >> playStory story itemId




story :: Story
story = Map.fromList
    [ (1, StoryItem
            "Você acorda no dia que começa a matrícula, você é um estudante de Engenharia de Software da FGA (UnB - Campus Gama) e está no 5º semestre. Depois de um semestre cheio de reprovações, você está dedicado a pegar todas as matérias que precisa!"
            [ (2, "Entrar no Sigaa.")
            , (9, "Dormir cedo e tentar outro dia.")
            , (20, "Pedir dicas para um veterano.")
            ])
        , (2, StoryItem
            "Ao tentar entrar no Sigaa logo no primeiro dia, percebe que o fluxo de pessoas está muito grande, o que levou o site a sobrecarregar e ficar muito lento. Você está ansioso, pois deseja descobrir como está a situação de solicitação de vagas nas matérias que deseja."
            [ (3, "Clique no botão 'Matrícula online' e prepare-se para a longa espera.")
            , (4, "Tente fazer um ritual de boa sorte para agilizar o sistema.")
            ])
        , (3, StoryItem
            "Ao escolher esperar a matrícula, você aguarda e enquanto isso vê no grupo do Telegram do curso de Engenharia de Software que o tempo médio de espera é de 40 minutos até o carregamento."
            [ (5, "Ler um livro.")
            , (9, "Escolher deixar para outro dia, afinal, prefere aproveitar seu tempo de férias para se divertir.")
            ])
        , (4, StoryItem
            "Você decide fazer um ritual para tentar acelerar o sistema de matrícula. Você acende algumas velas, coloca uma música de fundo de suspense e começa a dançar em torno do seu computador enquanto diz as palavras mágicas. No entanto, nada parece acontecer e você fica constrangido."
            [ (6, "Parar com o ritual e aguardar com muita paciência o sistema carregar.")
            , (9, "Desistir de se matricular no primeiro dia e ir assistir série para aproveitar as férias.")
            ])
        , (5, StoryItem
            "Após ler alguns capítulos do livro, o sistema carrega e chega a hora de selecionar as matrículas. Você seleciona suas opções e na hora de confirmar o sistema cai e é preciso recomeçar o processo."
            [ (7, "Você prepara mais um capítulo do livro e recomeça o processo.")
            , (9, "Desiste de se matricular por agora e vai chorar em posição fetal.")
            ])
        , (6, StoryItem
            "Após uma longa espera, finalmente são carregadas as matérias e você seleciona as desejadas. Quando você confirma a matrícula, o sistema cai e é preciso recomeçar o processo."
            [ (9, "Desiste e vai reclamar com os amigos como forma de aliviar o estresse.")
            , (8, "Bebe uma água para se acalmar e recomeça sua jornada, afinal você precisa passar por mais esse desafio para se formar.")
            ])
        , (7, StoryItem
            "Depois de uma longa espera, finalmente você consegue realizar a confirmação da matrícula. Com sua matrícula confirmada, você sai da situação com uma lição valiosa: 'Às vezes, um toque de humor e criatividade é tudo o que você precisa para superar os desafios. Mantenha um espírito leve e você sempre encontrará uma maneira de fazer as coisas funcionarem! (FIM)"
            [])
        , (8, StoryItem
            "Após se acalmar, você se arrisca novamente, afinal é só mais um dos obstáculos que você passa como aluno de software e já está acostumado ao fracasso na primeira tentativa. O sistema, aparentemente satisfeito, volta à vida e você consegue confirmar sua matrícula com sucesso. Com sua matrícula confirmada, você sai da situação com uma lição valiosa: 'Às vezes, um toque de humor e criatividade é tudo o que você precisa para superar os desafios. Mantenha um espírito leve e sempre encontrará uma maneira de fazer as coisas funcionarem! (FIM)"
            [])
        , (9, StoryItem
            "Você decide que não irá se estressar com isso no primeiro dia, afinal não é por ordem de chegada! Com isso, você relaxa e vai viver a sua noite. No outro dia você tinha um compromisso, então preferiu deixar para depois. Quando você foi perceber, já era o último dia de matrícula! Além disso, é o dia que você precisa lavar o chão da casa!"
            [ (10, "Entrar no Sigaa e tentar pegar uma matéria.")
            , (11, "Limpar o chão da casa.")
            ])
        , (10, StoryItem
            "Você entra no Sigaa o mais rápido que consegue, e entra na tela de matrícula. Você escolhe as matérias da melhor maneira possível e vai para a página de confirmação, ao digitar suas credenciais e clicar em ok, a seguinte mensagem aparece: 'Conexão com a internet perdida'."
            [ (12, "Tentar reiniciar o computador.")
            , (13, "Verificar o modem.")
            ])
        , (11, StoryItem
            "Você decide limpar o chão da casa e adia sua matrícula. Ao terminar a limpeza, você volta para o Sigaa e começa a matrícula sem problemas. Com sua matrícula confirmada, você sai da situação com uma lição valiosa: 'Às vezes, adiar as coisas pode ser uma estratégia eficaz. Não é o fim do mundo se você não fizer algo imediatamente. (FIM)"
            [])
        , (12, StoryItem
            "Você reinicia o computador e percebe que a internet realmente caiu, não foi um problema no site. Por algum motivo, a internet caiu. Logo em seguida, você escuta a voz da sua mãe na cozinha: 'Você não vai usar esse computador até você ir limpar o chão dessa casa!', você estava tão focado em ver os horários e matérias que você não percebeu as várias outras vezes que ela reclamou."
            [ (14, "Tentar argumentar com sua mãe.")
            , (11, "Ir limpar o chão da casa.")
            ])
        , (13, StoryItem
            "Você vai para a sala e procura o modem para ver se teve algum problema na internet, quando você chega lá, o modem sumiu! Logo em seguida, você escuta a voz da sua mãe na cozinha: 'Você não vai usar esse computador até você ir limpar o chão dessa casa!', você estava tão focado em ver os horários e matérias que você não percebeu as várias outras vezes que ela reclamou."
            [ (15, "Procurar onde ela escondeu o modem.")
            , (14, "Tentar argumentar com sua mãe.")
            ])
        , (14, StoryItem
            "Você tenta argumentar que é para pegar as matérias da faculdade e que se não fizer a matrícula, pode ficar atrasado, mas tudo é inútil, ela não quer te escutar, sem ter escolha, você vai lavar o chão. Ao terminar você entra no Sigaa para fazer a matrícula e olha o relógio: '00:20', o período de matrícula foi fechado."
            [ (16, "Tentar pegar as matérias na rematrícula.")
            , (17, "Resolver presencialmente na faculdade.")
            ])
        , (15, StoryItem
            "Você procura pela casa e finalmente encontra o modem escondido na estante de livros. Você reconecta a internet e volta para o computador para fazer a matrícula. Com sua matrícula confirmada, você sai da situação com uma lição valiosa: 'Às vezes, é preciso ser persistente e resolver problemas por conta própria para alcançar seus objetivos. (FIM)"
            [])
        , (16, StoryItem
            "Você decide tentar pegar as matérias na rematrícula. No entanto, a concorrência é alta e as vagas se esgotam rapidamente. Você só consegue pegar algumas matérias não desejadas. Você vai ter um semestre difícil pela frente."
            [ (18, "Aceitar as matérias e seguir em frente.")
            , (17, "Lutar por melhores matérias presencialmente na faculdade.")
            ])
        , (17, StoryItem
            "Você decide lutar por melhores matérias presencialmente na faculdade. Na manhã seguinte, você vai para a faculdade, depois de uma longa viagem de metrô e ônibus. Ao chegar lá, você encontra a faculdade vazia. Você segue para a recepção."
            [ (18, "Perguntar pelo orientador.")
            , (19, "Procurar os professores das matérias obrigatórias.")
            ])
        , (18, StoryItem
            "Você pergunta onde o orientador se encontra e é indicado sua localização. Você se dirige à sala dele e tem uma conversa muito amigável, o qual ele te orienta de tudo que você precisará fazer e que vai te ajudar a conseguir as vagas. No final das contas, você consegue 4 das 5 matérias que você queria, nada mal! (FIM)"
            [])
        , (19, StoryItem
            "Você pergunta onde é a sala dos professores das matérias que você quer pegar. Ao se dirigir a sala deles, você encontra alguns deles e descobre que os outros não estarão na faculdade até começar as aulas. Você consegue 3 das 5 matérias que você queria, próximo semestre você terá que ralar mais, mas irá sobreviver. (FIM)"
            [])
        , (20, StoryItem
            "Você relembra que um dos motivos das reprovações no último semestre foi tentar realizar diversas matérias muito difíceis ao mesmo tempo, por isso pensa que o melhor a se fazer agora é obter dicas de um amigo veterano para evitar cometer o mesmo erro. Entretanto, você lembra que ele provavelmente também está tentando realizar a matrícula nas turmas do próximo semestre."
            [ (21, "Pedir ajuda para seu amigo veterano agora.")
            , (9, "Deixar para fazer isso depois, afinal ele terá mais tempo para te auxiliar quando terminar a própria matrícula e talvez você nem precise tanto da ajuda dele.")
            ])
        , (21, StoryItem
            "Ao pensar em enviar uma mensagem para seu amigo, lembra que ele costuma demorar muito para responder, pois é uma pessoa muito ocupada e além da faculdade também trabalha em dois empregos diferentes."
            [ (22, "Enviar uma mensagem e esperar por uma resposta.")
            , (23, "Ligar para seu amigo, afinal vocês se conhecem a muito tempo e sabe que se  ligar ele provavelmente irá atender rapidamente.")
            ])
        , (22, StoryItem
            "Você envia uma mensagem e aguarda por uma resposta. Enquanto isso, você decide aproveitar suas férias e não se preocupar até receber uma resposta. Então se passaram diversos dias e aparentemente seu amigo esqueceu de responder sua mensagem, você acorda um determinado dia lembrando da situação e corre decidido ao computador para tentar  resolver logo essa situação, ao entrar no Sigaa clica em 'realizar matrícula' e vê que o prazo acabou no dia anterior."
            [ (16, "Tentar pegar as matérias na rematrícula.")
            , (17, "Resolver presencialmente na faculdade.")
            ])
        , (23, StoryItem
            "Você liga para seu amigo que rapidamente atende a sua chamada, ao explicar a situação para seu amigo ele diz que agora está ocupado e mais tarde está indo para uma festa e o convida para ir com ele e depois te explica melhor sobre como escolher melhor as disciplinas."
            [ (24, "Aceitar o convite e ir se divertir, afinal as férias são para isso.")
            , (2, "Recusar o convite e entrar no Sigaa para realizar a matrícula.")
            ])
        , (24, StoryItem
            "Você aceita o convite e vai para a festa se divertir, durante a noite aproveita bastante e escuta a ideia que seu amigo apresenta para todos como a melhor que ele já teve em toda sua vida: 'Galera, tive a melhor ideia da minha vida, vamos fazer uma viagem para aproveitar as férias, a gente aluga uma casa em Pirenópolis e aproveitamos o resto das férias lá', todos escutam a ideia encantados e decidem ir."
            [ (25, "Ir com a galera para Pirenópolis.")
            , (26, "Falar para seus amigos que precisa ficar em casa e terminar de realizar as matrículas.")
            ])
        , (25, StoryItem
            "Você e todos seus amigos saem na manhã do dia seguinte da festa, passam em suas casas, arrumam suas bagagens e vão para Pirenópolis sem ao menos descansar, com intuito de chegar lá o quanto antes para aproveitar bastante o local. Durante essa viagem você se diverte tanto que esquece que ainda tinha obrigações pendentes com a faculdade, mesmo durante o período das férias, então acaba perdendo o período de matrículas, rematrícula e matrícula extraordinária, o que é terrível, porque agora está sem nenhuma matéria para cursar durante o semestre. Devido a isso, alguns dias depois recebe o comunicado que está sendo jubilado da faculdade por não cursar um número suficiente de matérias com aproveitamento (aprovação) durante o ano. Com essa situação você aprende uma importante lição: 'Às vezes, é melhor fazer as tarefas importantes primeiro, principalmente antes de partir para diversão. (FIM)"
            [])
        , (26, StoryItem
            "Você lembra de falar com seu amigo veterano sobre as dúvidas que tinha antes de partir, ele te dá diversos bons conselhos e então você volta para casa preparado para realizar a melhor escolha de disciplina que já fez na vida. Ao chegar em casa o Sigaa não está mais tão congestionado, então realiza tranquilamente todas as atividades que tinha planejado, conseguindo ao final todas as 5 matérias que pediu e ainda sobrando um bom tempo para ir até onde seus amigos estão e aproveitar o resto das férias. Com sua matrícula confirmada, você sai da situação com uma lição valiosa: 'É importante se divertir, mas às vezes, é melhor deixar isso de lado para se obter bons resultados, portanto o equilíbrio é sempre (ou quase sempre) o melhor caminho. Se divirta, mas com consciência, pois assim você sempre encontrará uma maneira de fazer as coisas funcionarem! (FIM)"
            [])
        ]
