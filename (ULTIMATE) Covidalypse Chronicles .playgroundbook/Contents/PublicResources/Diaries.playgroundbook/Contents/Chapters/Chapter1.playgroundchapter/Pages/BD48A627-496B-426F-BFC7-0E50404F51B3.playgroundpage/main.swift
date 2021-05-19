

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    // label -> Nessa variável temos a UILabel em que o texto vai ser colocado 
    // (1) EXERCÍCIO: mudar o nome dessa variável para algo mais específico. Não se esqueça de alterar isso ao longo do código também! 
    var label = UILabel()
    
    // button -> Corresponde as ilustrações que aparecem na parte de baixo, elas são, na verdade, um UIButton que vai mudando o background
    var button = UIButton()
    
    // numberOfScreen -> Esse número corresponde ao número da "cena que está aparecendo" 
    var numberOfScreen:Int = 0
    
    // vectorText -> Um array criado para guardar as fala da personagem na sequência que aparecem
    // (2) EXERCÍCIO: Alterar o item no index 2, vamos mudar a receita um pouco!
    var vectorText:[String] = ["Hello! I’m Naiá, a native Brazilian. I live in a small native south american tribe located in the  Amazon. On Sundays, my husband Jaci and I eat a native dish called ''Moqueca de Peixe''. I want to teach you more about my culture and how to prepare this dish for your family...It’s tasty! Shall we? I almost forgot… If in your country there aren’t any of theese ingredients, you can replace them.\nTouch my face to see the first ingredient.The next ones will show up as you touch them.", "\n\nWash a 1kg sea bass in running water.", "\n\nSeason with a pinch of salt.", "\n\nSeason with a pinch of black pepper.","\n\nSqueeze a lemon.", "\n\nDice 3 tomatos and mix with the fish.","\n\nDice a red bell pepper and mix with the fish and tomatos.", "\n\nDice a green bell pepper and mix with the fish,\ntomatos and red bell pepper." ,"\n\nDice a yellow bell pepper and mix with the fish,\ntomatos, red bell pepper and green bell pepper.", "\n\nAdd palm oil to the mix.", "\n\nAdd coconut milk to the mix.", "\n\nArrange in layers, alternating the aromatics with\nthe fish. Bring to a high heat until it boils.","\n\nLower the heat, cover the pan and cook it\n until the fish is soft to the touch of the fork.\nIT'S READY!!!"]
    
    // vectorImage -> Um array criado para guardar os nomes das imagens na sequência que aparecem
    // (3) EXERCÍCIO: Trocar o item no index 4 pelo item do index 6, não gosto de gostinho azedo 
    // (4) EXERCÍCIO: Trocar o item no index 1 pelo asset de "Banana" que vai estar no chat da Zoom, essa moqueca é vegetariana!
    var vectorImages: [String] = ["cozinheira","peixe 2","sal","pimentao_vermelho","limao 2","tomate","pimentao_vermelho","pimentao_verde", "pimentao_amarelo", "azeite_de_dende", "leite_de_coco", "fogo", "Moqueca_de_peixe.jpg"]
    
    /* 
     viewDidLoad é a função onde as coisas acontecem, basicamente, ela define que tudo dentro dela vai ser executado assim que a view for carregada. 
     Por ser override, é uma função que já existe no sistema, por isso não precisar chamar ela no código. 
     */
    
    override func viewDidLoad() {
        
        // view é a camada onde colocamos tudo o que for visual do playground, é a camada no qual vão ficar nossos componentes. 
        // (5) EXERCÍCIO: Alterar a cor do background da view 
        self.view.backgroundColor = #colorLiteral(red: 0.9714753032, green: 0.9805012345, blue: 0.8598872423, alpha: 1.0)
        
        // Nesse pedaço do código, estão as configurações da label.
        // (6) EXERCÍCIO: Mudar o alinhamento do texto, a cor dele e o tamanho.
        label.font = UIFont(name: "TimesBold", size: 17.5)
        label.frame = .zero
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label.text = vectorText[numberOfScreen]
        
        // Configurações do botão. Esse botão tem uma imagem de background, que se altera toda vez que ele é clicado. Essa não é uma boa interação para o usuário, não é intuitiva. 
        
        // (7.1) EXERCÍCIO: Colocar uma UIImageView em tela
        // (7.2) EXERCÍCIO: Posicionar a UIImageview em tela utilizando constraints 
        // (7.3) EXERCÍCIO: Adicionar uma imagem na pasta de PrivateResources
        // (7.4) EXERCÍCIO: Colocar uma UIImage dentro dessa UIImageView 
        // (7.5) EXERCÍCIO: Criar um botão simples, escrito "próximo" 
        // (7.6) EXERCÍCIO: Alterar a imagem, toda vez que apertar no botão
        button.addTarget(self, action: #selector(updatesTheNumberOfScreens), for: .touchUpInside)
        button.setImage(UIImage(named: vectorImages[numberOfScreen]), for: .normal)
        
        view.addSubview(label)
        view.addSubview(button)
        
        addConstraints()
    }
    
    // Parece que estão faltando algumas constraints para esses objetos, as constraints existem para posicionar objetos em tela, e fazer com que eles se ajustem independente do tamanho da tela em que apareçam. 
    // (8.1) EXERCÍCIO: Adicionar constraint de altura e largura na label 
    // (8.2) EXERCÍCIO: Chamar a função translatesAutoresizingMaskIntoConstraints no botão que você criou no exercício 7.5, essa função serve para que o compilador "ignore" a posição do frame, e faça com que ele tenha a posição que você escrever nas constraints
    // (8.3) EXERCÍCIO: Colocar constraints no botão que você criou no exercício 7.5
    func addConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.preferredMaxLayoutWidth = 370
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 300).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    // A função updateScreen() foi criada pela autora do playgrounds, toda vez que a função é chamada, a tela é atualizada.
    // O vectorTexts declarado acima, é um vetor de Strings, que possui todos os textos EM ORDEM DE APARIÇÃO. 
    // A função atribui ao texto da label um valor contido em uma das posições do vetor vectorText.
    // Para encontrar posição do vectorText, a função o percorre em busca do item correspondente ao número que está armazenado na variável numberOfScreen. 
    // A mesma coisa acontece com as imagens. 
    func updateScreen(){
        label.text = vectorText[numberOfScreen]
        button.setImage(UIImage(named:vectorImages[numberOfScreen]), for: .normal)
    }
    
    // A função updatesTheNumberOfScreens() tem o @objc na frente de sua declaração, esse é um resquício da linguagem que veio antes do Swift, vamos explorá-lo mais a frente. 
    // Esse @objc permite que essa função seja chamada toda vez que o botão é selecionado. Basta olhar a criação do botão, a função está dentro da ação.
    // A função primeiramente checa se a variável numberOfScreens é igual (==) 12, isso significa que está na última cena. Caso esteja, a variável numberOfScreens recebe o valor 0, e reinicia a experiência chamando a função updateScreen()
    // Caso a variável numberOfScreens não seja igual (==) 12, é acrescentado 1 (+=) à  variável numberOfScreens, e a função updateScreen() é chamada. 
    @objc func updatesTheNumberOfScreens() {
        if numberOfScreen == 12 {
            numberOfScreen = 0
            updateScreen()
        }
        else {
            numberOfScreen+=1
            updateScreen()
        }
    }
}

PlaygroundPage.current.liveView = MyViewController()

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var label = UILabel()
    var button = UIButton()
    var numberOfScreen:Int = 0
    
    var vectorText:[String] = ["Diaries of the Apocalypse (Covidalypse), day 1:\n\n Hello! This is my World. Step lightly, or be devoured.\n\nhaha... just kidding. \n\nNote to self: Is it too crazy to start talking to my diary day 1, or just average crazy...? \n(later check with Gog, the Shaman, through the luminous artifact)\n\nDiary, after all these months I feel to have regressed to my primitive pre-civilizatory state of mind. My terapeut suggested I should incarnate this state and be at peace with it, so I dressed up accordingly and tried to reach a higher state of conscience... \n\n *omowmomwomwo* \n\n Nope. Nothing. Oh, that was my stomach you heard. All this effort just made me discover I'm so hungry I could eat an human arm... or maybe a leg.  Sometimes I feel lucky I live alone. Or perhaps whoever doesnt live with me is the lucky one, in which case should be everyone else, leaving me thus the only unlucky dude. Welcome to my life. It's sad. \n\nLet's check what the hell still survived in my fridger after the weekend in this post-apocalyptic cave of mine... you know what they say, if it doesn't kill you, it makes you stronger, right..?! ....right?", "\n\n\nOh. Nonononono. \n\nPete7, my man, my bro, how did your little fish tank end up inside my fridge? \n\nDamn, guess I was more messsed up yesterday than I remember...\n\n My bad, little one. Now I gotta eat your body to survive one more day... you shall be remembered, buddy... along with your six previous incarnations.", "\n\n\n\n\n\n\n\n\nhuh, I still got salt. One of the most ancient staple seasonings to food. Now that's an improvement to my sushi. \n\n *Whoooooosh* \n\n... why do I feel like I just jumped a few milennia?! \n\nToo weird... \n(...probably the echoes of yesterday, though) \n\n Geez, I wonder if I fried my brain for good this time.", "\n\nAnd pepper. Always pepper. It is probably rotten, if pepper could get rotten. Problem is: it doesnt. Hear, hear: this little thing will likely survive all of us. I'll pass. I only keep it for my mother, who was probably the last one that touched the bottle, and that was BEFORE the Covidalypse.\n\nYeah, I just decided that Apocalypse is like, soooo Zombie-season, at least to me. Sooo, for posterity, in order not to confuse the aliens-that-came-to-visit-but-too-late-now-we-already-destroyed-ourselves-congrats-retards or the illustrious Archeologists of the Next Sentient race that will populate this little mudball shooting through the void of space towards-nothing-in-particular, I decided to name it Covidalypse. \n\nMy diary, my rules. You're welcome to go dig another diary as complete as mine in this time and age. Heck, it's all data and bytes now. Fortunately, I and I alone have thought about the plight of future Archeologists and am doing my part. So shut up. Like YOU could come up with a better name, you Alien bastard.","\n\nHmm, half a lemon. Seems fitting... \n\n\n...you know, for adding more drops of sourness into the pool of Misery of my life? \n\n...yeah, yeah, I'm not a great joker, but I'm trying, ok? The stupid world is too gloomy to make jokes anyway, so just pretend my failed attempt of humor was in fact some sarcastic statement, which is more fitting.\n\n What else are you hide in thy Depths, O Fridge of Mine?!", "\n\nIs that a tomato? \n\nOh. Oh. Hm. \n\nShould've guessed. It was way too red to be true. And I don't even remember having a plastic tomato in here. Whatever, at least it adds a little color to the pallete. Perhaps I could fill it with rat poison to kill a burglar that decide to break into my house... \n\n... well probably the thief would rather sell the tomato than eat it, since it might be the most expensive non-broken-and-damaged-repeatedly item inside.","\n\nOh, and there's a plastic bell pepper too. Oh, now I remember these little fellas. Gift from an exposition I went... I guess? I should have just thrown it in the thrash, now the only thing these are useful is to make me more hungry. Like, my mouth SHOULD know better, it's obviously not real food. So stop salivating! NOW!\n\nGood. You know who's the boss here.", "\n\nOh. And a plastic GREEN pepper, too. Yeah, you don`t fool me, green bell pepper. Fruit of the same poisoned tree and all that. Pass." ,"\n\nI really should throw all these bell peppers in the thrash. Now I know why I stuffed these in the hidden compartments. Now I'm wishing I hadn't been so spineless trembling in fear of what my mother would say when she came visit.", "\n\nPalm oil? Hmm, so there's cooking involved...\n\nwoooooooosh\n\n... was that the age-milennia wind blowing again? Well, that's not logic, salt was obviously discovered AFTER fire and cooking.\n\n\nWOOOOOOSHHH\n\nOh. OH. Really?! So that first wind was taking me BACK to the dawn of men and THEN the second one to the discovery of fire?! Is that even a thing, now? \n\n Whatever. What else can I find in the deeper crevasses of my fridge-abyss?", "\n\nAdd coconut milk to the mix.", "\n\nArrange in layers, alternating the aromatics with\nthe fish. Bring to a high heat until it boils.","\n\nLower the heat, cover the pan and cook it\n until the fish is soft to the touch of the fork.\nIT'S READY!!!"]
    
    var vectorImages: [String] = ["india 2","peixe","sals","pimenta","limao","tomates","pimentao_vermelhos","pimentao_verdes", "pimentao_amarelos", "oleo de dende", "leitedecoco", "Ativo 2", "moqueca"]
    
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 0.9714753032, green: 0.9805012345, blue: 0.8598872423, alpha: 1.0)
        label.font = UIFont(name: "TimesBold", size: 17.5)
        label.frame = .zero
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label.text = vectorText[numberOfScreen]
        
        button.addTarget(self, action: #selector(updatesTheNumberOfScreens), for: .touchUpInside)
        button.setImage(UIImage(named: vectorImages[numberOfScreen]), for: .normal)
        
        view.addSubview(label)
        view.addSubview(button)
        
        addConstraints()
    }
    
    func addConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.preferredMaxLayoutWidth = 600
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    func updateScreen(){
        label.text = vectorText[numberOfScreen]
        button.setImage(UIImage(named:vectorImages[numberOfScreen]), for: .normal)
    }
    
    @objc func updatesTheNumberOfScreens() {
        if numberOfScreen == 12 {
            numberOfScreen = 0
            updateScreen()
        } 
        else {
            numberOfScreen+=1
            updateScreen()
        }
    }
}

PlaygroundPage.current.liveView = MyViewController()
