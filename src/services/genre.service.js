import * as genreRepository from '../repositories/genre.repository.js';
import ConflictError from '../errors/ConflictError.js';
import BadRequestError from '../errors/BadRequestError.js';

const createGenre = async ({ name }) => {
  if (name.length > 255) {
    throw new BadRequestError('Name is too big (over 255 chars).');
  }

  const genre = await genreRepository.findGenreByName({ name });

  if (genre) {
    throw new ConflictError(`The genre "${name}" already exists.`);
  }

  return genreRepository.createGenre({ name });
};

export {
  createGenre,
};
