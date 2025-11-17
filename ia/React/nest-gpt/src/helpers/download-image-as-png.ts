import * as path from "path";
import * as fs from "fs";
import sharp from "sharp";
import { InternalServerErrorException } from "@nestjs/common";

// Crear folder si no existe
const ensureFolder = (folderPath: string) => {
    if (!fs.existsSync(folderPath)) {
        fs.mkdirSync(folderPath, { recursive: true });
    }
};

const createImageName = (suffix = "") =>
    `${Date.now()}-${Math.round(Math.random() * 1e9)}${suffix}.png`;


// ======================================================
// 1. DESCARGAR IMAGEN DESDE URL Y GUARDAR COMO PNG
// ======================================================
export const downloadImageAsPng = async (url: string, fullPath: boolean = false) => {

    if (!url) {
        throw new InternalServerErrorException("Image URL is required");
    }

    let response: Response;

    try {
        response = await fetch(url);
    } catch (err) {
        console.error("Error fetching URL:", err);
        throw new InternalServerErrorException("Could not fetch the image URL");
    }

    if (!response.ok) {
        throw new InternalServerErrorException("Download image was not possible");
    }

    const buffer = Buffer.from(await response.arrayBuffer());

    const folderPath = path.resolve("./", "./generated/images/");
    ensureFolder(folderPath);

    const imageNamePng = createImageName();
    const completePath = path.join(folderPath, imageNamePng);

    try {
        await sharp(buffer).png().ensureAlpha().toFile(completePath);
    } catch (err) {
        console.error("Error converting image:", err);
        throw new InternalServerErrorException("Failed to process image with sharp");
    }

    return fullPath ? completePath : imageNamePng;

};


// ======================================================
// 2. DESCARGAR BASE64 Y GUARDAR COMO PNG
// ======================================================
export const downloadBase64ImageAsPng = async (base64Image: string, fullPath: boolean = false) => {

    if (!base64Image) {
        throw new InternalServerErrorException("Base64 image is required");
    }

    // Remover cualquier encabezado MIME si existe
    const cleanedBase64 = base64Image.replace(/^data:image\/\w+;base64,/, "");

    let imageBuffer: Buffer;

    try {
        imageBuffer = Buffer.from(cleanedBase64, "base64");
    } catch (err) {
        throw new InternalServerErrorException("Invalid base64 image");
    }

    const folderPath = path.resolve("./", "./generated/images/");
    ensureFolder(folderPath);

    const imageNamePng = createImageName("-64");
    const completePath = path.join(folderPath, imageNamePng);

    try {
        await sharp(imageBuffer)
            .png()
            .ensureAlpha()
            .toFile(completePath);
    } catch (err) {
        console.error("Sharp error:", err);
        throw new InternalServerErrorException("Failed to process base64 image");
    }

    return fullPath ? completePath : imageNamePng;
};
