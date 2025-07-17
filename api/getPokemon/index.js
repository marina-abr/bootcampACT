const axios = require('axios');

module.exports = async function (context, req) {
    const name = req.query.name || 'pikachu';

    try {
        const response = await axios.get(`https://pokeapi.co/api/v2/pokemon/${name}`);
        const data = response.data;

        const result = {
            name: data.name,
            id: data.id,
            height: data.height,
            weight: data.weight,
            base_experience: data.base_experience,
            types: data.types.map(t => t.type.name)
        };

        context.res = {
            status: 200,
            body: result
        };
    } catch (err) {
        context.res = {
            status: 500,
            body: `Error: ${err.message}`
        };
    }
};
