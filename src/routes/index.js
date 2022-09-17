import { Router } from 'express';
import {
  getAll, createRestaurante, deleteRestaurante, updateRestaurante,
} from '../controllers/restaurante.controller';

const routes = new Router();

routes.get('/', (req, res) => {
  res.status(200).json({ ok: 'conected' });
});

routes.get('/restaurantes', getAll);

routes.post('/restaurante', createRestaurante);

routes.delete('/restaurante/:id', deleteRestaurante);

routes.put('/restaurante/:id', updateRestaurante);

export default routes;
