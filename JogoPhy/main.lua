-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--OBS 
--Width = Largura
--Height = Altura

local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

--Textos
tapCount = 0
local TapText = display.newText( tapCount, display.contentCenterX, display.contentScaleY, native.systemFontBold, 40 )
TapText:setFillColor(0,0,0)

textoV = "Versão Alpha 0.5"
local versaotext = display.newText( textoV, display.contentCenterX, 20, native.systemFontBold, 32 )

credtxt = "By DK"
local creditostxt = display.newText( credtxt , display.contentCenterX, 60, native.systemFontBold , 22 ) 
-------==

local plataforma = display.newImageRect("platform.png", 300, 50 )
plataforma.x = display.contentCenterX
plataforma.y = display.contentHeight -25

local balao = display.newImageRect("balloon.png", 112, 112) 
balao.x = display.contentCenterX
balao.y = display.contentCenterY
balao.alpha = 0.8 --"alpha" serve para por transparencia no Objeto, e 0.8 = 80% de transparencia

--Adicionando Física
local physics = require("physics")
physics.start() --comando de inciar a física do jogo!
physics.addBody(plataforma, "static") --Convertendo Objetos para == Objetos Físicos
physics.addBody( balao,"dynamic", {radius=50, bounce=0.3}) --dynamic significa que o objeto é afetado pela gravidade, dynamic ja vem instanciado como padrão
--radius significa Raio, o raio bate na plataforma ent o valor seria o msm valor da altura do objeto, OBS: radius é utilizado para objetos redondos
--bounce, o pulo/ressalto do objeto, o quanto ele bate no chão o quanto a fisica é forte ao colidir



-------------
--Funções
-------------
local function pushBalao()
	--Isso é um evento
	balao:applyLinearImpulse( 0, -0.75, balao.x, balao.y ) --o 3 e 4 parametros "balao,y e balao.x", indicam onde aplicar essa força de impulso
	tapCount = tapCount + 1 --tapcount + 1 caso tenha 11 taps e agora será só mais == 12
	TapText.text = tapCount --a variavel que mostra o contador recebe o novo valor do contador
end

local function showFps()
	fps = display.fps
	local fpsShow = display.newText(fps, 300, -30, native.systemFont, 18)
	fpstxt = "fps:"
	local fpsTexto = display.newText(fpstxt, 270, -30, native.systemFont, 18)
end


--outro evento
--Um Evento é tbm conhecido como um Método de Objeto, 
balao:addEventListener( "tap", pushBalao ) --uma estrutura de evento padrão
--primeiro vc diz que objeto vai receber esse método\evento
--depois vc escreve qual o evento, e vem os parametros(primeiro o tipo de evento, e depois a função que escrevemos)

--evento fps
plataforma:addEventListener( "tap", showFps )
