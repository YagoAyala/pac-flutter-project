import {
  getAll, newRestaurante, restauranteExists, deleta, update,
} from '../models/restaurante.model';

const todos = async () => {
  const restaurantes = await getAll();
  return restaurantes;
};

const criar = async ({ nome }) => {
  const restaurante = await restauranteExists({ nome });

  if (restaurante) return restaurante;

  const restaurant = await newRestaurante({ nome });
  return restaurant;
};

const deletar = async ({ id }) => {
  const restaurante = await restauranteExists({ id });

  if (!restaurante) return { message: 'Restaurante não foi encontrado' };
  const restaurant = await deleta({ id });
  return restaurant;
};

const atualizar = async ({ id, nome }) => {
  const restaurantes = await restauranteExists({ id });
  if (!restaurantes) return { message: 'Restaurante não foi encontrado' };

  const restaurant = await update({ id, nome });
  return restaurant;
};

export {
  todos, criar, deletar, atualizar,
};
