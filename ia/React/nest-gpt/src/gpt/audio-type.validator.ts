import { BadRequestException } from '@nestjs/common';
import { FileValidator } from '@nestjs/common';

export class AudioFileValidator extends FileValidator {
  isValid(file?: Express.Multer.File): boolean {
    if (!file) return false;

    const allowedTypes = [
      'audio/mpeg',
      'audio/mp3',
      'audio/wav',
      'audio/mp4',
      'audio/x-m4a',
    ];

    return allowedTypes.includes(file.mimetype);
  }

  buildErrorMessage(file: Express.Multer.File): string {
    return `Tipo de archivo no permitido: ${file.mimetype}. Se esperan archivos de audio.`;
  }
}
