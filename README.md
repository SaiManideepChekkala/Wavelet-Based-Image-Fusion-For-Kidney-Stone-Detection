# 🧠 Wavelet-Based Image Fusion & Kidney Stone Detection

This MATLAB-based project combines **wavelet image fusion** and **medical image analysis** for **kidney stone detection**. It fuses CT and MRI images to enhance diagnostic value, then applies image processing techniques to identify potential kidney stones.

---

## 🔍 Key Features

### 🔗 1. Wavelet-Based Image Fusion
- Uses 2D Haar Discrete Wavelet Transform (`dwt2`) to decompose CT and MRI images.
- Fuses the decomposed coefficients via averaging.
- Reconstructs the fused image using Inverse DWT (`idwt2`).
- Enhances structural and soft tissue visibility in a single output image.

### 🧪 2. Kidney Stone Detection
- Allows user to upload a kidney scan image.
- Converts image to grayscale and applies thresholding.
- Morphological operations (complementing, filling holes, area filtering).
- Segmentation using ROI-based masking and `bwlabel` analysis.
- Displays "Stone Detected" if segmented areas meet criteria.

---

## 📁 Repository Structure
```
📁 19BEC0178_Capstone/
├── code.m # MATLAB script (image fusion + stone detection)
├── 19BEC0178_PRoject_Report.pdf # Full project report
├── 19BEC0178_IEEE_Paper.docx # IEEE-format technical paper
├── 19BEC0178_Final_PPT.pptx # Final project presentation
├── 19BEC0178_A3_Poster.pptx # A3 poster for display

```

---

## 🚀 How to Run

1. Open MATLAB.
2. Place CT, MRI, or kidney scan images in the project directory.
3. Run the script from `code.txt`.
4. For stone detection, use the file chooser to select a scan image.
5. Output includes image displays and stone detection result in console.

---

## 📌 Technologies Used

- MATLAB
- Haar Wavelet Transform
- Image Fusion
- Image Thresholding
- Morphological Operations
- Region-based Segmentation
- Medical Image Analysis

---

## 👨‍💻 Author

    🎓 Developed by: Ch. Sai Manideep  
    🏫 Capstone Project  
    🎯 Tech: MATLAB, Image Fusion, Kidney Stone Detection, DWT, Image Processing
---
