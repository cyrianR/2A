using LinearAlgebra
"""
Approximation de la solution du problème 

    min qₖ(s) = s'gₖ + 1/2 s' Hₖ s, sous la contrainte ‖s‖ ≤ Δₖ

# Syntaxe

    s = gct(g, H, Δ; kwargs...)

# Entrées

    - g : (Vector{<:Real}) le vecteur gₖ
    - H : (Matrix{<:Real}) la matrice Hₖ
    - Δ : (Real) le scalaire Δₖ
    - kwargs  : les options sous formes d'arguments "keywords", c'est-à-dire des arguments nommés
        • max_iter : le nombre maximal d'iterations (optionnel, par défaut 100)
        • tol_abs  : la tolérence absolue (optionnel, par défaut 1e-10)
        • tol_rel  : la tolérence relative (optionnel, par défaut 1e-8)

# Sorties

    - s : (Vector{<:Real}) une approximation de la solution du problème

# Exemple d'appel

    g = [0; 0]
    H = [7 0 ; 0 2]
    Δ = 1
    s = gct(g, H, Δ)

"""
function gct(g::Vector{<:Real}, H::Matrix{<:Real}, Δ::Real; 
    max_iter::Integer = 100, 
    tol_abs::Real = 1e-10, 
    tol_rel::Real = 1e-8)

    j = 0
    gj = g
    sj = zeros(length(g))
    pj = -g

    # itérer tant que les conditions d'arrêt CN1 et nombre d'itérations ne sont pas atteintes
    while j <= max_iter && norm(gj) > max(norm(gj)*tol_rel, tol_abs)
        κj = pj'*H*pj
        
        if κj <= 0
            σ1, σ2 = racines(sj,pj,Δ)
            q1, q2 = q(sj+σ1*pj, g, H), q(sj+σ2*pj, g, H)
            if q1 > q2
                return sj + σ2*pj
            else
                return sj + σ1*pj
            end
        end

        αj = gj' * gj / κj

        if norm(sj + αj*pj) >= Δ
            σ1, σ2 = racines(sj,pj,Δ)
            if σ1 >= 0
                return sj + σ1*pj
            elseif σ2 >= 0
                return sj + σ2*pj
            else 
                error("Pas de racine positive.")
            end
        end

        # mise à jour des variables
        sj = sj + αj*pj
        gj_next = gj + αj*H*pj
        βj = (gj_next'*gj_next) / (gj'*gj)
        pj = -gj_next + βj*pj
        gj = gj_next
        j = j + 1
    end

   return sj
end


"""
Calcul des racines de ∥sj + σ*pj ∥ = ∆.

# Syntaxe
    σ1, σ2 = racines(sj,pj)

# Entrées
    - sj : (Vector{<:Real}) le vecteur sj
    - pj : (Vector{<:Real}) le vecteur pj
    - Δ : (Real) le scalaire Δ

# Sorties
    - σ1 : Real première solution du problème
    - σ2 : Real deuxième solution du problème
"""
function racines(sj::Vector{<:Real},pj::Vector{<:Real}, Δ::Real)
    # on résoud l'équation ‖sj + σpj‖² = Δ² => σ²∥pj∥² + 2σ<sj,pj> + ∥sj∥² - ∆² = 0
    a = norm(pj)^2
    b = 2*sj'*pj
    c = norm(sj)^2 - Δ^2
    D = b^2 - 4*a*c

    if D < 0
        error("Discriminant négatif, pas de solution réelle")
    end

    σ1 = (-b + sqrt(D)) / (2*a)
    σ2 = (-b - sqrt(D)) / (2*a)

    return σ1, σ2;
end


"""
Fonction q(s) = g's + 1/2 s'Hs

# Syntaxe
    q = q(s,g,H)

# Entrées
    - s : Vector{<:Real} l'entrée de la fonction
    - g : (Vector{<:Real}) le paramètre gradient g
    - H : (atrix{<:Real}) le paramètre hessienne H

# Sorties
    - q : Real la valeur de la fonction q
"""
function q(s::Vector{<:Real}, g::Vector{<:Real}, H::Matrix{<:Real})
    return g'*s + 0.5*s'*H*s
end