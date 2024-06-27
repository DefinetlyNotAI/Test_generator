import os
import requests
from configparser import ConfigParser


class ImgBBHandler:
    def __init__(self, config_file_path='./imgbb.config', urls=None):
        self.config = self._read_config(config_file_path)
        self.api_key = self.config['api_key']
        self.directory_path_upload = self.config['directory_path_upload']
        self.directory_path_download = self.config['directory_path_download']

        # Assign URLs either from the config file or the provided parameter
        if urls is None:
            self.urls = self.config['urls']
        else:
            self.urls = urls

        self.image_extensions = ['.jpg', '.jpeg', '.png']

    @staticmethod
    def _read_config(file_path):
        config = ConfigParser()
        config.read(file_path)

        if len(config.sections()) != 1 or config.sections()[0] != 'Config-Imgbb':
            raise ValueError("Config file must contain exactly one section named 'Config-Imgbb'.")

        section = 'Config-Imgbb'
        options = config.options(section)
        required_options = ['api_key', 'directory_path_download', 'directory_path_upload']
        missing_options = [option for option in required_options if option not in options]

        if missing_options:
            raise ValueError(f"Missing required options in config file: {missing_options}")

        return {
            'api_key': config.get(section, 'api_key'),
            'directory_path_download': config.get(section, 'directory_path_download'),
            'directory_path_upload': config.get(section, 'directory_path_upload'),
        }

    def upload_images(self):
        image_files = self._find_image_files()

        for image_path in image_files:
            try:
                uploaded_image_url = self.upload_image(image_path)
                print(f"Uploaded Image URL: {uploaded_image_url}")

                # Create or open the Upload_Data.txt file in append mode
                with open('Upload_Data.txt', 'a') as data_file:
                    # Get the base name of the image file
                    filename = os.path.basename(image_path)
                    # Write the name of the file and its URL to the file
                    data_file.write(f"{filename} --> {uploaded_image_url}\n")

            except Exception as e:
                print(f"Error uploading {image_path}: {e}")

    def upload_image(self, image_path):
        with open(image_path, 'rb') as f:
            files = {'image': f}
            params = {'key': self.api_key}

            response = requests.post(
                'https://api.imgbb.com/1/upload',
                params=params,
                files=files
            )

        if response.status_code == 200:
            return response.json()['data']['url']
        else:
            raise Exception(f"Failed to upload image: {response.text}")

    def download_images(self):
        if not os.path.exists(self.directory_path_download):
            os.makedirs(self.directory_path_download)

        for url in self.urls:
            try:
                response = requests.get(url)

                if response.status_code == 200:
                    filename = os.path.basename(url)
                    filepath = os.path.join(self.directory_path_download, filename)
                    with open(filepath, 'wb') as f:
                        f.write(response.content)
                    print(f"Downloaded {filename} successfully and saved to {self.directory_path_download}.")
                else:
                    print(f"Failed to download {url}: {response.status_code}")
            except Exception as e:
                print(f"Error downloading {url}: {e}")

    def _find_image_files(self):
        image_files = []
        for root, dirs, files in os.walk(self.directory_path_upload):
            for file in files:
                if os.path.splitext(file)[1].lower() in self.image_extensions:
                    # Correctly accessing the class attribute
                    image_files.append(os.path.join(root, file))
        return image_files
