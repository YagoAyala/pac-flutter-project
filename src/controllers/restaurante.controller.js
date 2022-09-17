import {
  todos, criar, deletar, atualizar,
} from '../services/restaurante.services';

const getAll = async (req, res) => {
  const restaurantes = await todos();

  const id = '_id';

  const newList = restaurantes.map((restaurante) => (
    {
      nome: restaurante.nome,
      _id: restaurante[`${id}`],
    }
  ));

  return res.status(200).json(newList);
};

const createRestaurante = async (req, res) => {
  const { nome } = req.body;

  const { nome: name, _id } = await criar({ nome });
  return res.status(200).json({ name, _id });
};

const deleteRestaurante = async (req, res) => {
  const { id } = req.params;
  const restaurante = await deletar({ id });
  return res.status(204).json(restaurante);
};

const updateRestaurante = async (req, res) => {
  const { nome } = req.body;
  const { id } = req.params;

  const restaurante = await atualizar({ id, nome });
  res.status(200).json(restaurante);
};

const login = async () => null;

export {
  getAll, login, createRestaurante, deleteRestaurante, updateRestaurante,
};
