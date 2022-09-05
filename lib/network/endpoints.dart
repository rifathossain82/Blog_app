class API {
  static const BASE_URL = 'https://apiv1.techofic.com/app/techofice/';

  static const getAllBlogs = 'get-all-blog-list';
  static getBlogDetails({blogId}) => 'get-blog-details/$blogId';
  static const createBlog = 'create-blog';
  static const updateBlog = 'update-blog';
  static deleteBlog({blogId}) => 'remove-blog/$blogId';
  static const uploadImage = 'upload-image';
  static const addRemoveFavoriteBlog= 'update-favorite-blog';
  static const getAllFavoriteBlogs= 'get-favourite-blog-list ';
}
