%%% Parcial Paradigma Lógico - Pdep JM 2022 UTN.BA

%%% Apellido y nombre: <completar>
%%% Legajo: <completar>

% PUNTO 1

necesidad(respiracion, fisiologico).
necesidad(alimentacion, fisiologico).
necesidad(descanso, fisiologico).
necesidad(reproduccion, fisiologico).
necesidad(integridad, seguridad).
necesidad(empleo, seguridad).
necesidad(salud, seguridad).
necesidad(amistad, social).
necesidad(afecto, social).
necesidad(intimidad, social).
necesidad(confianza, reconocimiento).
necesidad(respeto, reconocimiento).
necesidad(exito, reconocimiento).
% un ejemplo cualquiera
necesidad(libertad, autorrealizacion).

nivelSuperior(autorrealizacion, reconocimiento).
nivelSuperior(reconocimiento, social).
nivelSuperior(social, seguridad).
nivelSuperior(seguridad, fisiologico).

% PUNTO 2

separacionEntre(NecesidadA,NecesidadB,Separacion):-
    necesidad(NecesidadA,NivelA),
    necesidad(NecesidadB,NivelB),
    separacionNiveles(NivelA,NivelB,Separacion).


separacionNiveles(Nivel,Nivel,0).
separacionNiveles(NivelA,NivelB,Separacion):-
    nivelSuperior(NivelB,NivelIntermedio),
    separacionNiveles(NivelA,NivelIntermedio,SepAnterior),
    Separacion is SepAnterior + 1.


% PUNTO 3
cantNivelesExistentes(Cant):-
    separacionNiveles(_,_,Cant),
    forall(separacionNiveles(_,_,Sep), Cant >= Sep).

% Otra forma de hacerlo (un poco más alejada del paradigma)
% podría ser usando findall + length sobre nivelSuperior/2.

% Punto 4

% atención a respetar los nombres elegidos en el punto 1
necesita(carla, alimentacion).
necesita(carla, descanso).
necesita(carla, empleo).
% no agrego empleo de juan porque por principio de universo cerrado quiero que de falso.
necesita(juan, afecto).
necesita(juan, exito).
necesita(camila, alimentacion).
necesita(camila, descanso).
necesita(roberto, amistad).
necesita(manuel, libertad).
necesita(charly, afecto).


% Punto 5

% necesidadMasJerarquica(Necesidad):-
% not o forall usando nivelSuperior
% "ningún nivel de otra necesidad es superior a esta"  
% o bien "todo otro nivel de otra necesidad es inferior a este nivel"

% Punto 6
% O sea "NO necesita nada de ese nivel"

% Punto 7
% a) seCumpleMaslowPara(Pers) :- todas sus necesidades son de 1 solo nivel.
% b) seCumpleParaTods :- (aridad 0) forall con el anterior
% c) seCumpleParaMayoria :- (aridad 0) acá hay que hacer findall y length 2 veces

% Punto 8