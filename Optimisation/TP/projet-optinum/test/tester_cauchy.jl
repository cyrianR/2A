# Ecrire les tests de l'algorithme du pas de Cauchy
using Test

function tester_cauchy(cauchy::Function)

    # tolérance pour les tests
    tol_erreur = sqrt(eps())

	Test.@testset "Pas de Cauchy" begin

        Test.@testset "f = x^2, Δₖ = 2, xₖ = -1 (a > 0)" begin
            Δ = 2
            g = [-2]
            H = ones(1,1)
            H[1,1] = 2
            s_sol_exacte = [1]
            s_sol = cauchy(g, H, Δ)
            Test.@test s_sol ≈ s_sol_exacte atol=tol_erreur
        end

        Test.@testset "f = x^2, Δₖ = 1, xₖ = -2 (a > 0)" begin
            Δ = 1
            g = [-4]
            H = ones(1,1)
            H[1,1] = 2
            s_sol_exacte = [1]
            s_sol = cauchy(g, H, Δ)
            Test.@test s_sol ≈ s_sol_exacte atol=tol_erreur
        end

        Test.@testset "f = x, Δₖ = 1, xₖ = 2 (a = 0)" begin
            Δ = 1
            g = [1]
            H = ones(1,1)
            H[1,1] = 0
            s_sol_exacte = [-1]
            s_sol = cauchy(g, H, Δ)
            Test.@test s_sol ≈ s_sol_exacte atol=tol_erreur
        end

        Test.@testset "f = -x^2, Δₖ = 1, xₖ = -2 (a < 0)" begin
            Δ = 1
            g = [4]
            H = ones(1,1)
            H[1,1] = -2
            s_sol_exacte = [-1]
            s_sol = cauchy(g, H, Δ)
            Test.@test s_sol ≈ s_sol_exacte atol=tol_erreur
        end

    end

end