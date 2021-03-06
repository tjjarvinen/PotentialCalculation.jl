using Test
using PotentialCalculation.UnitConversions

@testset "UnitConversions" begin
    e1 = 32.42
    e2 = 2.75E-4

    units = ["cm-1", "cm^-1", "ev", "eV", "kcal/mol", "kJ/mol", "kj/mol", "K"]

    for x in units
        t = energy_from(e1, x)
        @test t != e1
        @test e1 ≈ energy_to(t, x)
    end

    @test e2 ≈ change_energy_unit(e2, "eV", "eV")
    @test e2 == energy_from(e2, "hartree")
    @test e2 == energy_to(e2, "hartree")
end
