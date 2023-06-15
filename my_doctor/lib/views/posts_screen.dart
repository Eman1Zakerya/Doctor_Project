
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/controller/layout_cubit/cubit.dart';
import 'package:my_doctor/controller/layout_cubit/states.dart';
import '../models/posts_model.dart';





class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
            listener: (context, state) {},
            builder:  (context, state) {
              return ConditionalBuilder(
                condition: DoctorCubit.get(context).postsList.isNotEmpty,
                builder: ( context) =>Scaffold(
                  // backgroundColor: background,
                    body: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // const Card(
                          //   clipBehavior: Clip.antiAliasWithSaveLayer,
                          //   elevation: 5,
                          //   margin: EdgeInsets.all(8),
                          //   child: Image(
                          //     image: AssetImage(
                          //         'assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'),
                          //     fit: BoxFit.cover,
                          //     height: 300,
                          //     width: double.infinity,
                          //   ),
                          // ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration:    BoxDecoration(
                                image:const DecorationImage(
                                    image:AssetImage('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg',),
                                    fit: BoxFit.cover
                                ),

                                borderRadius: BorderRadius.circular(10)



                            ),

                          ),


                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var postsModel = DoctorCubit.get(context).postsList;
                                return Post_Item(postsModel: postsModel, index:index ,);
                              },

                              separatorBuilder: (context, index) =>const SizedBox(height: 8,),
                              itemCount: DoctorCubit.get(context).postsList.length
                          )



                        ],
                      ),
                    )


                ), fallback: (context)=>const Center(child: CircularProgressIndicator()),
              );
            },
            );

  }

}





class Post_Item extends StatelessWidget {
  const Post_Item({
    super.key,
    required this.postsModel, required this.index,
  });

   final List<PostsModel> postsModel;
   final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                      'assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:  [
                            Text(postsModel[index].catigoryName,
                              style: const TextStyle(height: 1.3, fontSize: 15),),
                            const SizedBox(width: 5,),
                            const Icon(Icons.check_circle,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ],
                        ),
                         Text(postsModel[index].datePosted,
                          style: const TextStyle(
                              height: 1.4,
                              fontSize: 13
                          ),)
                      ],
                    )
                ),
                const SizedBox(width: 16,),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz,
                      size: 16,
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Column(
              children:  [
                Center(
                    child: Text(
                        postsModel[index].title,

                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26
                      ),
                    ) ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                  postsModel[index].content,
                    style: const TextStyle(

                        fontSize: 20
                    ),
                  ),
                ),
              ],
            ),

           if(postsModel[index].imagepath !=Null)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image:  DecorationImage(
                          image: NetworkImage(postsModel[index].imagepath), //${model.postImage}
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),

                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //Icon(
                            // IconBroken.Chat,
                            // size: 16,
                            //  color: Colors.amber,
                            //),
                            SizedBox(width: 5,),

                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                        children: const [
                          CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg')
                          ),
                          SizedBox(width: 15,),
                          Text("Hawk")

                        ]
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 21,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5,),
                        Text('Like',
                          style: TextStyle(
                              fontSize: 21
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    //SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                  },
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}