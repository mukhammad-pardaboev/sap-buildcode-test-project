/**
 * 
 * @On(event = { "READ" }, entity = "full_stack_appSrv.SuperHeroes")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
    const { SuperHeroes } = cds.entities;

    // Fetch the SuperHeroes data
    const superHeroes = await SELECT.from(SuperHeroes);

    // Calculate age and modify description if age is greater than 500
    const currentDate = new Date();
    superHeroes.forEach(hero => {
        if (hero.birthdate) {
            const birthDate = new Date(hero.birthdate);
            const age = currentDate.getFullYear() - birthDate.getFullYear();
            if (age > 500) {
                hero.description = `An Immortal ${hero.description || ''}`;
            }
        }
    });

    // Return the modified data
    return superHeroes;
}