import setuptools

setuptools.setup(
    name='frontemare',
    description='preview frontemare themes in your terminal and setup',
    author='tetutaro',
    author_email='tetsutaro.maruyama@gmail.com',
    url='https://github.com/tetutaro/frontemare',
    license='MIT',
    packages=['frontemare']
    entry_points={
        'console_scripts': ['frontemare=frontemare:main']
    },
)
